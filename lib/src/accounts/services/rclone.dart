import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/log.dart';
import 'package:syncvault/src/accounts/models/drive_info_model.dart';
import 'package:syncvault/src/accounts/services/common.dart';
import 'package:syncvault/src/common/services/rclone.dart';
import 'package:syncvault/src/home/models/drive_provider.dart';
import 'package:syncvault/src/home/models/drive_provider_backend.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:ini_v2/ini.dart';

final _dio = GetIt.I<Dio>();

// FIXME:
const errorMsgMap = {
  'No code returned': 'Drive auth servers are not responding',
  r'address already in use': 'Restart the application to proceed',
};

Future<void> killProcessOnPort(int port) async {
  final result = await Process.run('lsof', ['-i', ':$port', '-t']);
  if (result.exitCode != 0 || result.stdout.toString().trim().isEmpty) {
    debugLogger.e('No process found running on port $port');
    return;
  }

  final pid = result.stdout.toString().trim();
  debugLogger.i('Killing process with PID $pid on port $port');

  final killResult = await Process.run('kill', ['-9', pid]);
  if (killResult.exitCode == 0) {
    debugLogger.i('Process killed.');
  } else {
    debugLogger.e('Failed to kill process: ${killResult.stderr}');
  }
}

Future<bool> checkProcessIsNotUsed(int port) async {
  final result = await Process.run('lsof', ['-i', ':$port', '-t']);

  return (result.exitCode != 0 || result.stdout.toString().trim().isEmpty);
}

@singleton
class RCloneAuthService implements AuthService {
  @override
  TaskEither<AppError, RemoteProviderModel> authorize({
    required DriveProviderBackend backend,
    required DriveProvider driveProvider,
    required String remoteName,
  }) {
    final utils = RCloneUtils();

    return TaskEither<AppError, RemoteProviderModel>.Do(($) async {
      final execPath = await $(utils.getRCloneExec());
      final configFile = await $(utils.getConfig());
      final rCloneConfig = await $(utils.getIniConfig());

      // TODO: Remove unnecessary try catch
      await $(
        TaskEither.tryCatch(() async {
          if (rCloneConfig.hasSection(remoteName)) {
            throw const GeneralError('Remote already exists', null, null);
          }
        }, (err, stackTrace) => err as AppError),
      );

      // Authorize with rclone for given provider
      final model = switch (backend) {
        OAuth2() => await $(
          TaskEither.tryCatch(
            () async {
              await killProcessOnPort(53682);

              // if (await checkProcessIsNotUsed(57000)) {
              //   final server = await Process.run(execPath, [
              //     'rcd',
              //     '--rc-addr',
              //     ':57000',
              //   ]);
              //   debugLogger.i(server.stdout);
              //   debugLogger.i(server.stderr);
              // }

              final process = await Process.start(execPath, [
                'authorize',
                '--auth-no-open-browser',
                driveProvider.providerName,
              ], runInShell: true);

              final output = StringBuffer();
              final errorOutput = StringBuffer();
              final urlPattern = RegExp(
                r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)',
              );

              var urlLaunched = false;

              process.stdout.transform(utf8.decoder).listen((data) {
                output.write(data);
              });
              process.stderr.transform(utf8.decoder).listen((data) {
                errorOutput.write(data);

                // Match url with regex (url is in stderr for whatever reason)
                if (!urlLaunched) {
                  final urlMatch = urlPattern.firstMatch(
                    errorOutput.toString(),
                  );
                  if (urlMatch != null) {
                    final url = urlMatch.group(0);
                    if (url != null) {
                      urlLaunched = true;
                      launchUrlString(url);
                      debugLogger.i('Auth URL launched: $url');
                    }
                  }
                }
              });

              // Wait for process to finish
              await process.exitCode;

              debugLogger.i(output.toString());
              debugLogger.i(errorOutput.toString());

              for (final errorMsg in errorMsgMap.values) {
                if (errorOutput.toString().allMatches(errorMsg).isNotEmpty) {
                  throw GeneralError(errorMsgMap[errorMsg]!, null, null);
                }
              }

              // Ensure URL was found and launched
              if (!urlLaunched) {
                throw const GeneralError(
                  'Could not fetch auth URL from RClone',
                  null,
                  null,
                );
              }

              final match =
                  RegExp(r'\{.+\}').stringMatch(output.toString()) ?? '';
              final Map<String, dynamic> authJson = jsonDecode(match);

              if (authJson case {
                'access_token': String accessToken,
                'refresh_token': String refreshToken,
                'expiry': String expiresIn,
              }) {
                final model = RemoteProviderModel(
                  remoteName: remoteName,
                  provider: driveProvider,
                  backend: OAuth2(
                    authJson: authJson,
                    accessToken: accessToken,
                    refreshToken: refreshToken,
                    expiresIn: expiresIn,
                  ),
                  createdAt: DateTime.now().toIso8601String(),
                  updatedAt: DateTime.now().toIso8601String(),
                  isRCloneBackend: true,
                );

                return model;
              } else {
                throw const GeneralError(
                  'Authorization response invalid',
                  null,
                  null,
                );
              }
            },
            (err, stackTrace) => ProviderError(
              driveProvider,
              ProviderOperationType.authorize,
              err,
              stackTrace,
            ).logError(),
          ),
        ),
        S3(:final url, :final accessKeyId, :final secretAccessKey) => await $(
          TaskEither.tryCatch(
            () async {
              final model = RemoteProviderModel(
                remoteName: remoteName,
                provider: driveProvider,
                backend: S3(
                  url: url,
                  accessKeyId: accessKeyId,
                  secretAccessKey: secretAccessKey,
                ),
                createdAt: DateTime.now().toIso8601String(),
                updatedAt: DateTime.now().toIso8601String(),
                isRCloneBackend: true,
              );

              return model;
            },
            (err, stackTrace) => ProviderError(
              driveProvider,
              ProviderOperationType.authorize,
              err,
              stackTrace,
            ).logError(),
          ),
        ),
        UserPassword(:final password, :final username) => await $(
          TaskEither.tryCatch(
            () async {
              // Password needs to be obscured by rclone for usage
              final process = await Process.run(execPath, [
                'obscure',
                password,
              ]);
              final obscPassword = process.stdout;

              final model = RemoteProviderModel(
                remoteName: remoteName,
                provider: driveProvider,
                backend: UserPassword(
                  username: username,
                  password: obscPassword,
                ),
                createdAt: DateTime.now().toIso8601String(),
                updatedAt: DateTime.now().toIso8601String(),
                isRCloneBackend: true,
              );

              return model;
            },
            (err, stackTrace) => ProviderError(
              driveProvider,
              ProviderOperationType.authorize,
              err,
              stackTrace,
            ).logError(),
          ),
        ),
        Webdav(:final password, :final url, :final user) => await $(
          TaskEither.tryCatch(
            () async {
              // Password needs to be obscured by rclone for usage
              final process = await Process.run(execPath, [
                'obscure',
                password,
              ]);
              final obscPassword = process.stdout;

              final model = RemoteProviderModel(
                remoteName: remoteName,
                provider: driveProvider,
                backend: Webdav(url: url, user: user, password: obscPassword),
                createdAt: DateTime.now().toIso8601String(),
                updatedAt: DateTime.now().toIso8601String(),
                isRCloneBackend: true,
              );

              return model;
            },
            (err, stackTrace) => ProviderError(
              driveProvider,
              ProviderOperationType.authorize,
              err,
              stackTrace,
            ).logError(),
          ),
        ),
        Local() => await $(
          TaskEither.right(
            RemoteProviderModel(
              remoteName: remoteName,
              provider: driveProvider,
              backend: backend,
              createdAt: DateTime.now().toIso8601String(),
              updatedAt: DateTime.now().toIso8601String(),
              isRCloneBackend: false,
            ),
          ),
        ),
      };

      // Write rclone output to rclone config file
      await $(
        TaskEither.tryCatch(
          () async {
            // TODO: Use Either instead of Option
            final toWrite = driveProvider
                .rCloneTemplate(model.backend)
                .toOption()
                .getOrElse(
                  () => throw const GeneralError(
                    'Unable to fetch template for given provider.',
                    null,
                    null,
                  ),
                );

            // OneDrive requires drive ID which is not provided by rclone
            if (model.provider is OneDriveProvider) {
              final backend = model.backend as OAuth2;
              final response = await _dio.get(
                'https://graph.microsoft.com/v1.0/me/drive',
                options: Options(
                  headers: {
                    'Authorization': 'Bearer ${backend.accessToken}',
                    'Content-Type': 'application/json',
                  },
                ),
              );
              if (response.statusCode != 200) {
                throw HttpError(
                  'Microsoft Graph API cannot be accessed right now.',
                  response.statusCode!,
                  response.data,
                  null,
                  null,
                );
              }

              final driveId = response.data['id'];
              toWrite['drive_id'] = driveId;
            }

            // TODO: Refactor to getIniConfig
            final iniConfig = Config.fromString(
              await configFile.readAsString(),
            );
            iniConfig.add(model.remoteName, toWrite);

            await configFile.writeAsString(iniConfig.toString());
          },
          (err, stackTrace) => StorageError(
            StorageErrorType.update,
            StorageProviderType.rCloneConfig,
            err,
            stackTrace,
          ),
        ),
      );

      return model;
    });
  }

  @override
  TaskEither<AppError, Option<DriveInfoModel>> driveInfo({
    required RemoteProviderModel model,
  }) {
    final utils = RCloneUtils();

    return TaskEither<AppError, Option<DriveInfoModel>>.Do(($) async {
      final execPath = await $(utils.getRCloneExec());
      final configArgs = await $(utils.getConfigArgs());

      return await $(
        TaskEither.tryCatch(
          () async {
            final process = await Process.run(execPath, [
              ...configArgs,
              'about',
              '--json',
              '--full',
              '${model.remoteName}:',
            ]);

            if (process.stderr.toString().trim().isNotEmpty) {
              debugLogger.e(process.stderr.toString());
            }

            final output = process.stdout.toString();

            if (output.trim().isEmpty) {
              return none();
            }

            final json = jsonDecode(output);

            return some(
              DriveInfoModel(
                remainingStorage: Option.fromNullable(json['free']),
                usedStorage: Option.fromNullable(json['used']),
                totalStorage: Option.fromNullable(json['total']),
              ),
            );
          },
          (err, stackTrace) => GeneralError(
            'Failed to get drive information',
            err,
            stackTrace,
          ).logError(),
        ),
      );
    });
  }

  @override
  TaskEither<AppError, bool> isHealthy({required RemoteProviderModel model}) {
    final utils = RCloneUtils();

    return TaskEither.Do(($) async {
      final execPath = await $(utils.getRCloneExec());
      final configArgs = await $(utils.getConfigArgs());

      return await $(
        TaskEither.tryCatch(
          () async {
            final process = await Process.run(execPath, [
              ...configArgs,
              'lsd',
              '${model.remoteName}:',
            ]);

            return process.exitCode == 0;
          },
          (err, st) => ProviderError(
            model.provider,
            ProviderOperationType.getDriveInfo,
            err,
            st,
          ),
        ),
      );
    });
  }
}

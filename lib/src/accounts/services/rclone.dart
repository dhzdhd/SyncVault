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
import 'package:syncvault/src/common/models/drive_provider.dart';
import 'package:syncvault/src/common/services/rclone.dart';
import 'package:syncvault/src/home/models/drive_provider_backend.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:ini_v2/ini.dart';

final _dio = GetIt.I<Dio>();

@singleton
class RCloneAuthService implements AuthService {
  @override
  TaskEither<AppError, DriveProviderModel> authorize({
    required DriveProviderBackend backend,
    required DriveProvider driveProvider,
    required String remoteName,
  }) {
    final utils = RCloneUtils();

    return TaskEither<AppError, DriveProviderModel>.Do(($) async {
      final execPath = await $(utils.getRCloneExec());
      final configFile = await $(utils.getConfig());
      final rCloneConfig = await $(utils.getIniConfig());

      await $(
        TaskEither.tryCatch(
          () async {
            if (rCloneConfig.hasSection(remoteName)) {
              throw const AppError.general('Remote already exists');
            }
          },
          (err, stackTrace) =>
              err.handleError('Remote already exists', stackTrace),
        ),
      );

      // Authorize with rclone for given provider
      final model = switch (backend) {
        OAuth2() => await $(
          TaskEither.tryCatch(
            () async {
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

              // Listen to stdout, stderr
              process.stdout.transform(utf8.decoder).listen((data) {
                output.write(data);
              });
              process.stderr.transform(utf8.decoder).listen((data) {
                errorOutput.write(data);

                // Match url with regex (url is in stderr for whatever reason)
                final match = urlPattern.firstMatch(data);
                if (match != null) {
                  final url = match.group(0);
                  if (url != null) {
                    launchUrlString(url);
                  }
                }
              });
              print(output);
              print(errorOutput);

              // Wait for process to finish
              await process.exitCode;

              final match =
                  RegExp(r'\{.+\}').stringMatch(output.toString()) ?? '';
              final Map<String, dynamic> authJson = jsonDecode(match);
              if (authJson case {
                'access_token': String accessToken,
                'refresh_token': String refreshToken,
                'expiry': String expiresIn,
              }) {
                final model = DriveProviderModel(
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
                throw const GeneralError('Authorization response invalid');
              }
            },
            (err, stackTrace) =>
                err.handleError('OAuth2 auth failed', stackTrace),
          ),
        ),
        S3(:final url, :final accessKeyId, :final secretAccessKey) => await $(
          TaskEither.tryCatch(
            () async {
              final model = DriveProviderModel(
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
            (err, stackTrace) => err.handleError('S3 auth failed', stackTrace),
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

              final model = DriveProviderModel(
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
            (err, stackTrace) =>
                err.handleError('UserPassword auth failed', stackTrace),
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

              final model = DriveProviderModel(
                remoteName: remoteName,
                provider: driveProvider,
                backend: Webdav(url: url, user: user, password: obscPassword),
                createdAt: DateTime.now().toIso8601String(),
                updatedAt: DateTime.now().toIso8601String(),
                isRCloneBackend: true,
              );

              return model;
            },
            (err, stackTrace) =>
                err.handleError('Webdav auth failed', stackTrace),
          ),
        ),
      };

      // Write rclone output to rclone config file
      await $(
        TaskEither.tryCatch(
          () async {
            final toWrite = driveProvider
                .template(backend: model.backend)
                .getOrElse(
                  () => throw const GeneralError(
                    'Unable to fetch template for given provider.',
                  ),
                );

            // OneDrive requires drive ID which is not provided by rclone
            if (model.provider == DriveProvider.oneDrive) {
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
                throw const HttpError(
                  'Microsoft Graph API cannot be accessed right now.',
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
          (err, stackTrace) =>
              err.handleError('Failed to write output to config', stackTrace),
        ),
      );

      return model;
    });
  }

  @override
  TaskEither<AppError, Option<DriveInfoModel>> driveInfo({
    required DriveProviderModel model,
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
          (err, stackTrace) =>
              err.handleError('Failed to get drive information', stackTrace),
        ),
      );
    });
  }
}

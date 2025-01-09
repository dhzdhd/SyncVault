import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/log.dart';
import 'package:syncvault/src/accounts/models/drive_info_model.dart';
import 'package:syncvault/src/common/models/drive_provider.dart';
import 'package:syncvault/src/common/services/rclone.dart';
import 'package:syncvault/src/home/models/drive_provider_backend.dart';
import 'package:syncvault/src/home/models/drive_provider_backend_payload.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:ini_v2/ini.dart';

final _dio = GetIt.I<Dio>();

@singleton
class RCloneAuthService {
  TaskEither<AppError, DriveProviderModel> authorize({
    required DriveProviderBackendPayload payload,
    required DriveProvider driveProvider,
  }) {
    final utils = RCloneUtils();

    return TaskEither<AppError, DriveProviderModel>.Do(($) async {
      final execPath = await $(utils.getRCloneExec());
      final configFile = await $(utils.getConfig());
      final rCloneConfig = await $(utils.getIniConfig());

      await $(TaskEither.tryCatch(
        () async {
          if (rCloneConfig.hasSection(payload.remoteName)) {
            throw const AppError.general('Remote already exists');
          }
        },
        (err, stackTrace) =>
            err.handleError('Remote already exists', stackTrace),
      ));

      // Authorize with rclone for given provider
      final model = switch (driveProvider.backend) {
        const (OAuth2) => await $(
            TaskEither.tryCatch(
              () async {
                payload = payload as OAuth2Payload;

                print(driveProvider.providerName);
                final process = await Process.start(
                  execPath,
                  [
                    'authorize',
                    '--auth-no-open-browser',
                    driveProvider.providerName
                  ],
                  runInShell: true,
                );

                final output = StringBuffer();
                final errorOutput = StringBuffer();
                final urlPattern = RegExp(
                    r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)');

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

                // Wait for process to finish
                await process.exitCode;

                final match =
                    RegExp(r'\{.+\}').stringMatch(output.toString()) ?? '';
                final Map<String, dynamic> authJson = jsonDecode(
                  // FIXME: This probably breaks on android release builds
                  match,
                );
                if (authJson
                    case {
                      'access_token': String accessToken,
                      'refresh_token': String refreshToken,
                      'expiry': String expiresIn,
                    }) {
                  final model = DriveProviderModel(
                    remoteName: payload.remoteName,
                    provider: driveProvider,
                    backend: OAuth2(
                      rCloneJson: authJson,
                      accessToken: accessToken,
                      refreshToken: refreshToken,
                      expiresIn: expiresIn,
                    ),
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
        const (S3) => await $(
            TaskEither.tryCatch(
              () async {
                final s3Payload = payload as S3Payload;

                final model = DriveProviderModel(
                  remoteName: payload.remoteName,
                  provider: driveProvider,
                  backend: S3(
                    url: s3Payload.url,
                    accessKeyId: s3Payload.accessKeyId,
                    secretAccessKey: s3Payload.secretAccessKey,
                  ),
                );

                return model;
              },
              (err, stackTrace) =>
                  err.handleError('S3 auth failed', stackTrace),
            ),
          ),
        const (UserPassword) => await $(
            TaskEither.tryCatch(
              () async {
                final userPassPayload = payload as UserPasswordPayload;

                // Password needs to be obscured by rclone for usage
                final process = await Process.run(
                    execPath, ['obscure', userPassPayload.password]);
                final obscPassword = process.stdout;

                final model = DriveProviderModel(
                  remoteName: payload.remoteName,
                  provider: driveProvider,
                  backend: UserPassword(
                    username: userPassPayload.username,
                    password: obscPassword,
                  ),
                );

                return model;
              },
              (err, stackTrace) =>
                  err.handleError('UserPassword auth failed', stackTrace),
            ),
          ),
        const (Webdav) => await $(
            TaskEither.tryCatch(
              () async {
                final webdavPayload = payload as WebdavPayload;

                // Password needs to be obscured by rclone for usage
                final process = await Process.run(
                    execPath, ['obscure', webdavPayload.password]);
                final obscPassword = process.stdout;

                final model = DriveProviderModel(
                  remoteName: payload.remoteName,
                  provider: driveProvider,
                  backend: Webdav(
                    url: webdavPayload.url,
                    user: webdavPayload.user,
                    password: obscPassword,
                  ),
                );

                return model;
              },
              (err, stackTrace) =>
                  err.handleError('Webdav auth failed', stackTrace),
            ),
          ),
        // TODO: Do not throw in a Do()
        _ => throw UnimplementedError('Selected provider does not work yet')
      };

      // Write rclone output to rclone config file
      await $(
        TaskEither.tryCatch(
          () async {
            final toWrite =
                driveProvider.template(backend: model.backend).getOrElse(
                      () => throw const GeneralError(
                        'Unable to fetch template for given provider.',
                      ),
                    );

            // OneDrive requires drive ID which is not provided by rclone
            if (model.provider == DriveProvider.oneDrive) {
              final backend = model.backend as OAuth2;
              final response =
                  await _dio.get('https://graph.microsoft.com/v1.0/me/drive',
                      options: Options(headers: {
                        'Authorization': 'Bearer ${backend.accessToken}',
                        'Content-Type': 'application/json',
                      }));
              if (response.statusCode != 200) {
                throw const HttpError(
                    'Microsoft Graph API cannot be accessed right now.');
              }

              final driveId = response.data['id'];
              toWrite['drive_id'] = driveId;
            }

            // TODO: Refactor to getIniConfig
            final iniConfig =
                Config.fromString(await configFile.readAsString());
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

  TaskEither<AppError, Option<DriveInfoModel>> driveInfo(
      {required DriveProviderModel model}) {
    final utils = RCloneUtils();

    return TaskEither<AppError, Option<DriveInfoModel>>.Do(($) async {
      final execPath = await $(utils.getRCloneExec());
      final configArgs = await $(utils.getConfigArgs());

      return await $(TaskEither.tryCatch(
        () async {
          final process = await Process.run(
            execPath,
            [
              ...configArgs,
              'about',
              '--json',
              '--full',
              '${model.remoteName}:'
            ],
          );

          if (process.stderr.toString().trim().isNotEmpty) {
            debugLogger.e(process.stderr.toString());
          }

          final output = process.stdout.toString();

          if (output.trim().isEmpty) {
            return none();
          }

          final json = jsonDecode(output);

          return some(DriveInfoModel(
            remainingStorage: Option.fromNullable(json['free']),
            usedStorage: Option.fromNullable(json['used']),
            totalStorage: Option.fromNullable(json['total']),
          ));
        },
        (err, stackTrace) =>
            err.handleError('Failed to get drive information', stackTrace),
      ));
    });
  }
}

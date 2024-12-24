import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/helpers.dart';
import 'package:syncvault/log.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/home/models/drive_provider_backend.dart';
import 'package:syncvault/src/home/models/drive_provider_backend_payload.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';
import 'package:syncvault/src/home/services/rclone_template.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:ini_v2/ini.dart';

enum DriveProvider {
  oneDrive('onedrive', 'assets/logos/onedrive.svg', OAuth2),
  googleDrive('drive', 'assets/logos/gdrive.svg', OAuth2),
  dropBox('dropbox', 'assets/logos/dropbox.svg', OAuth2),
  minio('s3', '', S3),
  nextCloud('webdav', '', Webdav);

  Option<Map<String, String>> template({
    required DriveProviderBackendPayload payload,
    required DriveProviderBackend backend,
  }) {
    return Option.fromNullable(providerTemplate[this])
        .map((func) => func(payload.remoteName, backend));
  }

  const DriveProvider(this.providerName, this.providerIcon, this.backend);

  final String providerName;
  final String providerIcon;
  // TODO: Somehow relate to DriveProviderBackend without switch case
  final Type backend;
}

@singleton
class RCloneUtils {
  TaskEither<AppError, String> getRCloneExec() {
    return TaskEither.tryCatch(() async {
      if (Platform.isAndroid) {
        const channel = MethodChannel('com.example.syncvault/native_lib');
        final path = await channel.invokeMethod('getNativeLibraryPath');
        return '$path/librclone.so';
      } else if (PlatformExtension.isDesktop) {
        final docDir = await getApplicationDocumentsDirectory();
        // FIXME:
        final file = Glob('rclone.exe')
            .listSync(root: '${docDir.path}/SyncVault')[0] as File;
        return file.path;
      } else if (Platform.isIOS) {
        throw UnimplementedError('RClone not implemented in iOS yet');
      } else {
        throw UnimplementedError('This platform is not supported yet');
      }
    }, (err, stackTrace) {
      debugLogger.e(stackTrace);
      return err.segregateError();
    });
  }

  TaskEither<AppError, File> getConfig() {
    return TaskEither.tryCatch(() async {
      late final File configFile;

      if (PlatformExtension.isDesktop) {
        final docDir = await getApplicationDocumentsDirectory();
        configFile = File('${docDir.path}/SyncVault/rclone.conf');
      } else if (PlatformExtension.isMobile) {
        configFile = File('./rclone.conf');
      } else {
        throw const GeneralError('Platform not supported');
      }

      if (!(await configFile.exists())) {
        await configFile.create(recursive: true);
      }

      return configFile;
    }, (err, stackTrace) {
      debugLogger.e(stackTrace);
      return err.segregateError();
    });
  }

  TaskEither<AppError, List<String>> getConfigArgs() {
    return getConfig().map((file) => ['--config', file.path]);
  }
}

// TODO:
// Authorize with rclone auth as give below
// rclone config create & rclone config file (to show location)
// rclone config show to show file, can convert to json too
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

      // Authorize with rclone for given provider
      final model = switch (driveProvider.backend) {
        const (OAuth2) => await $(
            TaskEither.tryCatch(
              () async {
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

                final Map<String, dynamic> authJson = jsonDecode(
                    RegExp(r'\{.+\}').stringMatch(output.toString())!);
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
              (err, stackTrace) {
                print(stackTrace);
                return err.segregateError();
              },
            ),
          ),
        _ => DriveProviderModel(
            remoteName: 'remoteName',
            provider: driveProvider,
            backend: const S3(),
          )
      };

      // Write rclone output to rclone config file
      await $(
        TaskEither.tryCatch(
          () async {
            final toWrite = driveProvider
                .template(payload: payload, backend: model.backend)
                .getOrElse(
                  () => throw const GeneralError(
                      'Unable to fetch template for given provider.'),
                );

            final iniConfig =
                Config.fromString(await configFile.readAsString());
            iniConfig.add(model.remoteName, toWrite);

            await configFile.writeAsString(iniConfig.toString());
          },
          (err, stackTrace) => err.segregateError(),
        ),
      );

      return model;
    });
  }
}

@singleton
class RCloneDriveService {
  TaskEither<AppError, FolderModel> create({
    required DriveProviderModel model,
    required String folderPath,
    required String folderName,
    String remoteParentPath = 'SyncVault/',
  }) {
    final utils = RCloneUtils();

    return TaskEither<AppError, FolderModel>.Do(($) async {
      final execPath = await $(utils.getRCloneExec());
      final configArgs = await $(utils.getConfigArgs());

      await $(TaskEither.tryCatch(() async {
        final process = await Process.run(execPath, [
          ...configArgs,
          'mkdir',
          '${model.remoteName}:/$remoteParentPath$folderName'
        ]);
        final output = process.stdout.toString().split('\n');

        print(process.stderr);
        print(process.stdout);

        return ();
      }, (err, stackTrace) => err.segregateError()));

      final folderModel = FolderModel(
        remoteName: model.remoteName,
        provider: model.provider,
        folderPath: '/$remoteParentPath$folderName',
        folderName: folderName,
        isAutoSync: false,
        isDeletionEnabled: false,
        isTwoWaySync: false,
      );
      return folderModel;
    });
  }

  TaskEither<AppError, ()> upload(
      {required DriveProviderModel providerModel,
      required FolderModel folderModel,
      required String localPath}) {
    final utils = RCloneUtils();

    return TaskEither<AppError, ()>.Do(($) async {
      final execPath = await $(utils.getRCloneExec());

      final res = await $(TaskEither.tryCatch(() async {
        final process = await Process.run(execPath, [
          'sync',
          localPath,
        ]);
        final output = process.stdout.toString().split('\n');

        print(output);

        return ();
      }, (err, stackTrace) => err.segregateError()));

      return res;
    });
  }
}

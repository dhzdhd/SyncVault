import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/helpers.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';
import 'package:syncvault/src/home/models/remote_folder_model.dart';
import 'package:syncvault/src/home/services/rclone_template.dart';
import 'package:url_launcher/url_launcher_string.dart';

enum DriveProvider {
  oneDrive('onedrive', 'assets/logos/onedrive.svg'),
  googleDrive('drive', 'assets/logos/gdrive.svg'),
  dropBox('dropbox', 'assets/logos/dropbox.svg');

  Option<String> template(String remoteName, String rCloneJson) {
    return Option.fromNullable(providerTemplate[this]).map(
      (t) => t.format(
        {'remoteName': remoteName, 'rCloneJson': rCloneJson},
      ),
    );
  }

  const DriveProvider(this.providerName, this.providerIcon);

  final String providerName;
  final String providerIcon;
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
        // TODO: Glob the rclone path for multiplatform support
        return '${docDir.path}/SyncVault/rclone.exe';
      } else if (Platform.isIOS) {
        throw UnimplementedError('RClone not implemented in iOS yet');
      } else {
        throw UnimplementedError('This platform is not supported yet');
      }
    }, (err, stackTrace) => err.segregateError());
  }

  TaskEither<AppError, String> getConfig() {
    return TaskEither<AppError, String>.Do(($) async {
      final rCloneExec = await $(getRCloneExec());
      final rCloneConfig = await $(
        TaskEither.tryCatch(
          () async {
            final process = await Process.run(rCloneExec, ['config', 'file']);
            return process.stdout.toString().split('\n').last;
          },
          (err, stackTrace) => err.segregateError(),
        ),
      );

      return rCloneConfig;
    });
  }
}

// TODO:
// Authorize with rclone auth as give below
// rclone config create & rclone config file (to show location)
// rclone config show to show file, can convert to json too
@singleton
class RCloneAuthService {
  TaskEither<AppError, DriveProviderModel> authorize({
    required String remoteName,
    required DriveProvider driveProvider,
  }) {
    final utils = RCloneUtils();

    return TaskEither<AppError, DriveProviderModel>.Do(($) async {
      final execPath = await $(utils.getRCloneExec());
      final configPath = await $(utils.getConfig());

      // Authorize with rclone for given provider
      final model = await $(
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

            final authJson =
                jsonDecode(RegExp(r'\{.+\}').stringMatch(output.toString())!);
            if (authJson
                case {
                  'access_token': String accessToken,
                  'refresh_token': String refreshToken,
                  'expiry': String expiresIn,
                }) {
              final model = DriveProviderModel(
                remoteName: '',
                provider: driveProvider,
                rCloneJson: authJson,
                accessToken: accessToken,
                refreshToken: refreshToken,
                expiresIn: expiresIn,
              );

              return model;
            } else {
              throw const GeneralError('Authorization response invalid');
            }
          },
          (err, stackTrace) {
            return err.segregateError();
          },
        ),
      );

      // Write rclone output to rclone config file
      await $(
        TaskEither.tryCatch(
          () async {
            final rCloneConfig = File(configPath);

            final toWrite = driveProvider
                .template(model.remoteName, model.rCloneJson.toString())
                .getOrElse(
                  () => throw const GeneralError(
                      'Unable to fetch template for given provider.'),
                );

            await rCloneConfig.writeAsString(
              '\n$toWrite',
              mode: FileMode.append,
            );
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
  TaskEither<AppError, ()> create(
      {required DriveProviderModel model, required String folderName}) {
    final utils = RCloneUtils();

    return TaskEither<AppError, ()>.Do(($) async {
      final execPath = await $(utils.getRCloneExec());

      final res = await $(TaskEither.tryCatch(() async {
        final process = await Process.run(
            execPath, ['mkdir', '${model.remoteName}:/SyncVault/$folderName']);
        final output = process.stdout.toString().split('\n');

        print(output);

        return ();
      }, (err, stackTrace) => err.segregateError()));

      return res;
    });
  }

  TaskEither<AppError, ()> upload(
      {required DriveProviderModel providerModel,
      required RemoteFolderModel folderModel,
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

import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncvault/errors.dart';

import 'package:ini_v2/ini.dart';
import 'package:syncvault/src/common/models/drive_provider.dart';
import 'package:syncvault/src/home/models/drive_provider_backend.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';

@singleton
class RCloneUtils {
  TaskEither<AppError, String> getRCloneExec() {
    return TaskEither.tryCatch(() async {
      if (Platform.isAndroid) {
        const channel = MethodChannel('com.example.syncvault/native_lib');
        final path = await channel.invokeMethod('getNativeLibraryPath');
        return '$path/librclone.so';
      } else if (Platform.isWindows) {
        final docDir = await getApplicationDocumentsDirectory();
        return File('${docDir.path}/SyncVault/rclone.exe').path;
      } else if (Platform.isLinux || Platform.isMacOS) {
        final docDir = await getApplicationDocumentsDirectory();
        return File('${docDir.path}/SyncVault/rclone').path;
      } else if (Platform.isIOS) {
        throw UnimplementedError('RClone not implemented in iOS yet');
      } else {
        throw UnimplementedError('This platform is not supported yet');
      }
    }, (err, stackTrace) => err.handleError(err.toString(), stackTrace));
  }

  TaskEither<AppError, File> getConfig() {
    return TaskEither.tryCatch(
      () async {
        final docDir = await getApplicationDocumentsDirectory();
        final configFile = File('${docDir.path}/SyncVault/rclone.conf');

        if (!(await configFile.exists())) {
          await configFile.create(recursive: true);
        }

        return configFile;
      },
      (err, stackTrace) {
        return err.handleError('Failed to get rclone config file', stackTrace);
      },
    );
  }

  TaskEither<AppError, List<String>> getConfigArgs() {
    return getConfig().map((file) => ['--config', file.path]);
  }

  // TODO: Pass file contents instead of reading
  TaskEither<AppError, Config> getIniConfig() {
    return TaskEither<AppError, Config>.Do(($) async {
      final configFile = await $(getConfig());

      return await $(
        TaskEither<AppError, Config>.tryCatch(
          () async {
            final raw = await configFile.readAsString();
            return Config.fromString(raw);
          },
          (err, stackTrace) =>
              err.handleError('Failed to read ini file', stackTrace),
        ),
      );
    });
  }

  TaskEither<AppError, List<DriveProviderModel>> parseModelFromConfig() {
    return TaskEither<AppError, List<DriveProviderModel>>.Do(($) async {
      final config = await $(getIniConfig());

      return await $(
        TaskEither<AppError, List<DriveProviderModel>>.tryCatch(
          () async {
            return config.sections().map((sectionName) {
              final remoteName =
                  config.get(sectionName, 'type') ??
                  config.get(sectionName, 'provider')!;
              final provider = DriveProvider.getProviderByName(
                remoteName,
              ).toNullable()!;

              final backend = switch (provider) {
                DriveProvider.googleDrive ||
                DriveProvider.dropBox ||
                DriveProvider.oneDrive ||
                DriveProvider.protonDrive => (() {
                  final json = jsonDecode(config.get(sectionName, 'token')!);

                  return DriveProviderBackend.oauth2(
                    authJson: json,
                    accessToken: json['access_token'],
                    refreshToken: json['refresh_token'],
                    expiresIn: json['expiry'],
                  );
                })(),
                DriveProvider.minio => DriveProviderBackend.s3(
                  url: config.get(sectionName, 'endpoint')!,
                  accessKeyId: config.get(sectionName, 'access_key_id')!,
                  secretAccessKey: config.get(
                    sectionName,
                    'secret_access_key',
                  )!,
                ),
                DriveProvider.nextCloud => DriveProviderBackend.webdav(
                  url: config.get(sectionName, 'url')!,
                  user: config.get(sectionName, 'user')!,
                  password: config.get(sectionName, 'password')!,
                ),
              };

              return DriveProviderModel(
                remoteName: sectionName,
                provider: provider,
                backend: backend,
                createdAt: DateTime.now().toIso8601String(),
                updatedAt: DateTime.now().toIso8601String(),
                isRCloneBackend: true,
              );
            }).toList();
          },
          (err, stackTrace) =>
              err.handleError('Failed to write ini file', stackTrace),
        ),
      );
    });
  }
}

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncvault/errors.dart';

import 'package:ini_v2/ini.dart';

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
}

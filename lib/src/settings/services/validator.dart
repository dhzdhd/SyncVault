import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/log.dart';

final class SettingsValidator {
  static TaskEither<AppError, bool> isRClonePathValid(String path) {
    return TaskEither.tryCatch(() async {
      final result = await Process.run(path, ['version']);

      final stdout = result.stdout.toString();
      final stderr = result.stderr.toString();

      debugLogger.i(stdout);
      debugLogger.e(stderr);

      if (stderr.isNotEmpty) return false;

      return stdout.startsWith('rclone');
    }, (err, st) => AppError.general('Invalid RClone path', err, st));
  }

  static TaskEither<AppError, bool> isRCloneConfigPathValid(
    String rClonePath,
    String path,
  ) {
    return TaskEither.tryCatch(() async {
      final result = await Process.run(rClonePath, [
        'config',
        '--config',
        path,
      ]);

      final stdout = result.stdout.toString();
      final stderr = result.stderr.toString();

      debugLogger.i(stdout);
      debugLogger.e(stderr);

      if (stderr.isNotEmpty) return false;

      return stdout.startsWith('Current') || stdout.startsWith('No remotes');
    }, (err, st) => AppError.general('Invalid RClone config path', err, st));
  }
}

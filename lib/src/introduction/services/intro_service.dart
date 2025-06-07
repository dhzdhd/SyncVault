import 'dart:async';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';
import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/log.dart';
import 'package:syncvault/src/introduction/models/intro_model.dart';

@singleton
class IntroService {
  static const introSettingsKey = 'intro_settings';

  static const windowsRCloneUrl =
      'https://downloads.rclone.org/v1.67.0/rclone-v1.67.0-windows-amd64.zip';
  static const linuxRCloneUrl =
      'https://downloads.rclone.org/v1.67.0/rclone-v1.67.0-linux-amd64.zip';
  static const macOSRCloneUrl =
      'https://downloads.rclone.org/v1.67.0/rclone-v1.67.0-osx-arm64.zip';

  final _dio = GetIt.I<Dio>();
  final _box = GetIt.I<Box<IntroSettingsModel>>();

  IntroSettingsModel fetch() {
    final defaultValue = IntroSettingsModel.defaultValue();

    try {
      return _box.get(introSettingsKey, defaultValue: defaultValue)!;
    } catch (err) {
      debugLogger.e('SettingsModel failed to initialize');
      // fileLogger.e('SettingsModel failed to initialize');  // FIXME:

      return defaultValue;
    }
  }

  Either<AppError, ()> setLocalStorage(IntroSettingsModel model) {
    return Either.tryCatch(
      () {
        _box.put(introSettingsKey, model);
        return ();
      },
      (err, stackTrace) => StorageError(
        StorageErrorType.update,
        StorageProviderType.hive,
        err,
        stackTrace,
      ),
    );
  }

  Future<File> getRCloneExec() async {
    final dir = await getApplicationDocumentsDirectory();
    final unzippedPath = '${dir.path}/SyncVault/RCloneDir';
    return Glob('**/rclone*').listSync(root: unzippedPath)[0] as File;
  }

  Future<File> getRCloneOne() async {
    final dir = await getApplicationDocumentsDirectory();
    final unzippedPath = '${dir.path}/SyncVault/RCloneDir';
    return Glob('**/rclone.1').listSync(root: unzippedPath)[0] as File;
  }

  Stream<Either<AppError, int>> downloadRClone() async* {
    late final String url;
    final progressStreamController = StreamController<int>();

    try {
      // Do not implement switch case over OS string as the string can change internally
      // Instead, use the exposed getter to safeguard against such changes
      if (Platform.isWindows) {
        url = windowsRCloneUrl;
      } else if (Platform.isMacOS) {
        url = macOSRCloneUrl;
      } else if (Platform.isLinux) {
        url = linuxRCloneUrl;
      } else {
        throw UnimplementedError('Not implemented for current platform!');
      }

      final appDir = await getApplicationDocumentsDirectory();
      final downloadPath = '${appDir.path}/SyncVault/RCloneDir.zip';
      final unzippedPath = '${appDir.path}/SyncVault/RCloneDir';

      _dio
          .download(
            url,
            downloadPath,
            onReceiveProgress: (received, total) {
              progressStreamController.add(((received / total) * 100).round());
            },
            options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              },
            ),
          )
          .then((_) async {
            await extractFileToDisk(downloadPath, unzippedPath);
            await File(downloadPath).delete();

            // Delete similarly named rclone.1 file
            final rCloneOne = await getRCloneOne();
            await rCloneOne.delete();

            // Move rclone executable outside
            final rCloneExec = await getRCloneExec();
            final lastSeparator = rCloneExec.path.lastIndexOf(
              Platform.pathSeparator,
            );
            final execName = rCloneExec.path.substring(lastSeparator);

            // Rename does not work at times across different file systems
            await rCloneExec.copy('${appDir.path}/SyncVault/$execName');

            // Cleanup
            await File(unzippedPath).delete(recursive: true);
          });

      yield* progressStreamController.stream.map((val) => Right(val));
    } catch (err, stackTrace) {
      final error = switch (err) {
        DioException(:final response) => HttpError(
          url,
          response?.statusCode ?? 500,
          response?.data,
          err,
          stackTrace,
        ),
        _ => HttpError(url, 500, {}, err, stackTrace),
      };

      yield Left(error);
    } finally {
      progressStreamController.close();
    }
  }
}

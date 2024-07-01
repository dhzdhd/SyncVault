import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/log.dart';
import 'package:syncvault/src/introduction/models/intro_model.dart';

class IntroService {
  final _dio = GetIt.I<Dio>();
  static const androidRCloneUrl =
      'https://beta.rclone.org/v1.67.0/testbuilds/rclone-android-21-armv8a.gz';
  static const windowsRCloneUrl =
      'https://downloads.rclone.org/v1.67.0/rclone-v1.67.0-windows-amd64.zip';

  IntroSettingsModel fetch() {
    const defaultValue = IntroSettingsModel(alreadyViewed: false);

    try {
      final Map<String, dynamic> raw = jsonDecode(
        Hive.box('vault').get(
          'introSettings',
          defaultValue: jsonEncode(defaultValue.toJson()),
        ),
      );

      return IntroSettingsModel.fromJson(raw);
    } catch (err) {
      debugLogger.e('SettingsModel failed to initialize');
      fileLogger.e('SettingsModel failed to initialize');

      return defaultValue;
    }
  }

  Stream<Either<AppError, int>> downloadRClone() async* {
    final url = switch (Platform.operatingSystem) {
      'windows' => windowsRCloneUrl,
      'android' => androidRCloneUrl,
      _ => '',
    };

    final progressStreamController = StreamController<int>();

    final dir = await getApplicationDocumentsDirectory();
    final downloadPath = switch (Platform.operatingSystem) {
      'windows' => '${dir.path}/SyncVault/RClone.zip',
      'android' => '${dir.path}/SyncVault/RClone.tgz',
      _ => '',
    };
    final unzippedPath = '${dir.path}/SyncVault/RClone';
    final execPath = '${dir.path}/SyncVault';

    try {
      _dio.download(
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
      ).then((_) async {
        await extractFileToDisk(downloadPath, unzippedPath, asyncWrite: true);
        await File(downloadPath).delete();

        final rCloneExecutable = Glob('**/rclone{.exe,*}')
            .listSync(root: unzippedPath)
            .first as File;
        await rCloneExecutable.copy(execPath);

        await File(unzippedPath).delete(recursive: true);
      });

      yield* progressStreamController.stream.map((val) => Right(val));
    } catch (err) {
      yield Left(err.segregateError());
    } finally {
      progressStreamController.close();
    }
  }
}

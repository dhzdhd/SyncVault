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

  Either<AppError, ()> setLocalStorage(IntroSettingsModel model) {
    return Either.tryCatch(() {
      Hive.box('vault').put('introSettings', jsonEncode(model.toJson()));
      return ();
    }, (err, stackTrace) => err.segregateError());
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
    final url = switch (Platform.operatingSystem) {
      'windows' => windowsRCloneUrl,
      _ => '',
    };

    final progressStreamController = StreamController<int>();

    final dir = await getApplicationDocumentsDirectory();
    final downloadPath = '${dir.path}/SyncVault/RCloneDir.zip';
    final unzippedPath = '${dir.path}/SyncVault/RCloneDir';

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
        await extractFileToDisk(downloadPath, unzippedPath);
        await File(downloadPath).delete();

        final rCloneOne = await getRCloneOne();
        await rCloneOne.delete();

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

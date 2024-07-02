import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';
import 'package:syncvault/src/home/models/remote_folder_model.dart';
import 'package:syncvault/src/introduction/services/intro_service.dart';

enum DriveProvider {
  oneDrive('onedrive'),
  googleDrive('drive');

  const DriveProvider(this.providerName);

  final String providerName;
}

class RCloneAuthService {
  Future<RemoteFolderModel> check() async {
    final rCloneExec = await IntroService().getRCloneExec();

    final res = await Process.run(rCloneExec.path, ['authorize', 'drive']);
    print(res.stdout);

    return RemoteFolderModel(provider: DriveProvider.googleDrive);
  }

  TaskEither<AppError, DriveProviderModel> authorize(
      {required DriveProvider driveProvider}) {
    return TaskEither.tryCatch(() async {
      // final rCloneExec = await IntroService().getRCloneExec();

      // final ress = await Process.run(
      //     'ls', ['-a', '/data/user/0/com.example.syncvault/'],
      //     runInShell: true);
      // print(ress.stdout);
      // print('hi');

      const channel = MethodChannel('com.example.syncvault/native_lib');
      final path = await channel.invokeMethod('getNativeLibraryPath');
      print(path);

      // final res = await Process.run('ls', ['-a', path], runInShell: true);
      // print(res.stdout);
      // print(res.stderr);

      final res = await Process.run(
        '$path/librclone.so',
        ['authorize', '--auth-no-open-browser', driveProvider.providerName],
      );

      print(res.stdout);
      print(res.stderr);

      final authJson = jsonDecode(RegExp(r'\{.+\}').stringMatch(res.stdout)!);
      if (authJson
          case {
            'access_token': String accessToken,
            'refresh_token': String refreshToken,
            'expiry': String expiresIn
          }) {
        return DriveProviderModel(
            accessToken: accessToken,
            refreshToken: refreshToken,
            expiresIn: expiresIn);
      } else {
        throw const GeneralError('Authorization response invalid');
      }
    }, (err, stackTrace) => err.segregateError());
  }
}

class RCloneDriveService {
  var rClonePath =
      '${getApplicationDocumentsDirectory()}/SyncVault/RClone/rclone-v1.67.0-windows-amd64/rclone.exe';
}

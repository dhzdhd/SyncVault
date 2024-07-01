import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';
import 'package:syncvault/src/home/models/remote_folder_model.dart';

enum DriveProvider {
  oneDrive('onedrive'),
  googleDrive('drive');

  const DriveProvider(this.providerName);

  final String providerName;
}

class RCloneAuthService {
  Future<RemoteFolderModel> check() async {
    final docDir = await getApplicationDocumentsDirectory();
    final rClonePath =
        '${docDir.path}/SyncVault/RClone/rclone-v1.67.0-windows-amd64/rclone.exe';

    final res = await Process.run(rClonePath, ['authorize', 'drive']);
    print(res.stdout);

    return RemoteFolderModel(provider: DriveProvider.googleDrive);
  }

  TaskEither<AppError, DriveProviderModel> authorize(
      {required DriveProvider driveProvider}) {
    return TaskEither.tryCatch(() async {
      final docDir = await getApplicationDocumentsDirectory();
      final rClonePath =
          '${docDir.path}/SyncVault/RClone/rclone-v1.67.0-windows-amd64/rclone.exe';

      final res = await Process.run(
          rClonePath, ['authorize', driveProvider.providerName]);

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

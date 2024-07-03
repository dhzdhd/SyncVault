import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

enum DriveProvider {
  oneDrive('onedrive'),
  googleDrive('drive');

  const DriveProvider(this.providerName);

  final String providerName;
}

class RCloneAuthService {
  TaskEither<AppError, DriveProviderModel> authorize({
    required DriveProvider driveProvider,
  }) {
    return TaskEither.tryCatch(() async {
      const channel = MethodChannel('com.example.syncvault/native_lib');
      final path = await channel.invokeMethod('getNativeLibraryPath');

      final process = await Process.start(
        '$path/librclone.so',
        ['authorize', '--auth-no-open-browser', driveProvider.providerName],
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
        return DriveProviderModel(
          accessToken: accessToken,
          refreshToken: refreshToken,
          expiresIn: expiresIn,
        );
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

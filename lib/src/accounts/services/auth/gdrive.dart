import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:dio/dio.dart';

import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';
import 'package:syncvault/src/accounts/models/drive_info_model.dart';
import 'package:syncvault/src/accounts/services/auth_service.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/accounts/services/drive/gdrive.dart';
import 'package:syncvault/src/accounts/models/filter.dart';

final _dio = GetIt.I<Dio>();

@singleton
final class GoogleDriveAuth implements AuthService {
  static final clientId = Platform.isAndroid
      ? '844110357681-4sa1ev4ep3thlfa5gq3l4pjigvv3n98q.apps.googleusercontent.com'
      : '844110357681-uf9kcigbrju05jhebrr58388b3ij299d.apps.googleusercontent.com';
  static final callbackUrlScheme = Platform.isAndroid
      ? 'com.googleusercontent.apps.844110357681-4sa1ev4ep3thlfa5gq3l4pjigvv3n98q'
      : 'http://localhost:8006';
  static const authHost = 'accounts.google.com';
  static final clientSecret = dotenv.env['GDRIVE_SECRET']!;
  static const apiHost = 'www.googleapis.com';

  @override
  TaskEither<AppError, AuthProviderModel> signIn() {
    final codeUri = Uri.https(
      authHost,
      '/o/oauth2/v2/auth',
      {
        'client_id': clientId,
        'response_type': 'code',
        'redirect_uri':
            Platform.isAndroid ? '$callbackUrlScheme:/' : callbackUrlScheme,
        'scope':
            'https://www.googleapis.com/auth/drive.file https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email',
        'state': '12345',
        'access_type': 'offline',
        'prompt': 'select_account consent',
      },
    );

    return TaskEither.tryCatch(() async {
      final result = switch (Platform.isAndroid) {
        true => await FlutterWebAuth2.authenticate(
            url: codeUri.toString(),
            callbackUrlScheme: callbackUrlScheme,
            options: const FlutterWebAuth2Options(
              intentFlags: ephemeralIntentFlags,
            ),
          ),
        false => await FlutterWebAuth2.authenticate(
            url: codeUri.toString(),
            callbackUrlScheme: callbackUrlScheme,
            options: const FlutterWebAuth2Options(
              preferEphemeral: true,
            ),
          ),
      };

      final code = Uri.parse(result).queryParameters['code'];

      final tokenUri = Uri.https(
        apiHost,
        '/oauth2/v4/token',
      );

      final options = Options(
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      );
      final response = await _dio.postUri<Map<String, dynamic>>(
        tokenUri,
        data: {
          'client_id': clientId,
          'code': code,
          'grant_type': 'authorization_code',
          if (Platform.isWindows) 'client_secret': clientSecret,
          'redirect_uri':
              Platform.isAndroid ? '$callbackUrlScheme:/' : callbackUrlScheme,
        },
        options: options,
      );

      final accessToken = response.data!['access_token'];

      final user = (await getUserInfo(accessToken).run()).match(
        (l) => throw l,
        (r) => r,
      );

      final folders = await GoogleDrive()
          .getAllItems(
            accessToken: accessToken,
            root: none(),
            filter: const Some(Filter.name('SyncVault')),
          )
          .run();

      final id = await folders.match((l) => throw l, (r) async {
        if (r.isNotEmpty) {
          return r.first.id;
        } else {
          final folderIdResult = await GoogleDrive()
              .createFolder(
                folderName: none(),
                accessToken: accessToken,
                parentId: none(),
              )
              .run();

          return folderIdResult.match((l) => throw l, (r) => r);
        }
      });

      return AuthProviderModel(
        accessToken: accessToken,
        refreshToken: response.data!['refresh_token'],
        expiresIn: response.data!['expires_in'],
        provider: AuthProviderType.googleDrive,
        email: user['email'],
        name: user['name'],
        createdAt: DateTime.now().toIso8601String(),
        folderId: id,
      );
    }, (error, stackTrace) {
      return error.segregateError();
    });
  }

  @override
  TaskEither<AppError, AuthProviderModel> refresh(AuthProviderModel model) {
    final prev = DateTime.parse(model.createdAt);
    final now = DateTime.now();
    final diff = prev.add(Duration(seconds: model.expiresIn)).compareTo(now);

    return TaskEither.tryCatch(() async {
      if (diff <= 0) {
        final options = Options(
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        );
        final uri = Uri.https(
          apiHost,
          '/oauth2/v4/token',
        );
        final response = await _dio.postUri<Map<String, dynamic>>(
          uri,
          data: {
            'client_id': clientId,
            'grant_type': 'refresh_token',
            if (Platform.isWindows) 'client_secret': clientSecret,
            'redirect_uri':
                Platform.isAndroid ? '$callbackUrlScheme:/' : callbackUrlScheme,
            'refresh_token': model.refreshToken,
          },
          options: options,
        );

        return model.copyWith(
          accessToken: response.data!['access_token'],
          expiresIn: response.data!['expires_in'],
        );
      } else {
        return model;
      }
    }, (error, stackTrace) {
      return error.segregateError();
    });
  }

  @override
  TaskEither<AppError, Map<String, dynamic>> getUserInfo(String accessToken) {
    final authOptions = Options(headers: {
      'Authorization': 'Bearer $accessToken',
    });

    return TaskEither.tryCatch(() async {
      final uri = Uri.https(apiHost, '/oauth2/v2/userinfo');
      final response = await _dio.getUri<Map<String, dynamic>>(
        uri,
        options: authOptions,
      );

      return response.data!;
    }, (error, stackTrace) {
      return error.segregateError();
    });
  }

  @override
  TaskEither<AppError, DriveInfoModel> getDriveInfo(String accessToken) {
    final authOptions = Options(headers: {
      'Authorization': 'Bearer $accessToken',
    });

    final uri =
        Uri.https(apiHost, '/drive/v3/about', {'fields': 'storageQuota'});

    return TaskEither.tryCatch(
      () async {
        final response = await _dio.getUri<Map<String, dynamic>>(
          uri,
          options: authOptions,
        );

        return DriveInfoModel(
          remainingStorage: int.parse(response.data!['storageQuota']['limit']) -
              int.parse(response.data!['storageQuota']['usage']),
          usedStorage: int.parse(response.data!['storageQuota']['usage']),
          totalStorage: int.parse(response.data!['storageQuota']['limit']),
        );
      },
      (error, stackTrace) => error.segregateError(),
    );
  }
}

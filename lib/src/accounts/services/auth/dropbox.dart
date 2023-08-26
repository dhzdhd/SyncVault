import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:dio/dio.dart';

import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:fpdart/fpdart.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';
import 'package:syncvault/src/accounts/models/drive_info_model.dart';
import 'package:syncvault/src/accounts/services/auth_service.dart';
import 'package:syncvault/src/accounts/services/drive/dropbox.dart';
import 'package:syncvault/errors.dart';

final dio = Dio();

final class DropBoxAuth implements AuthService {
  static const clientId = 'ma42r73plfcdnrf';
  static final clientSecret = dotenv.env['DROPBOX_SECRET']!;
  static final callbackUrlScheme = Platform.isAndroid
      ? 'https://www.dropbox.com/1/oauth2/redirect_receiver'
      : 'http://localhost:8006';
  static const apiHost = 'api.dropboxapi.com';
  static const authHost = 'www.dropbox.com';

  @override
  TaskEither<AppError, AuthProviderModel> signIn() {
    final codeUri = Uri.https(
      authHost,
      '/oauth2/authorize',
      {
        'client_id': clientId,
        'response_type': 'code',
        'redirect_uri': callbackUrlScheme,
        'scope': 'files.content.read files.content.write account_info.read',
        'state': '12345',
        'token_access_type': 'offline',
      },
    );

    return TaskEither.tryCatch(() async {
      final result = switch (Platform.isAndroid) {
        true => await FlutterWebAuth2.authenticate(
            url: codeUri.toString(),
            callbackUrlScheme: 'https',
            preferEphemeral: true,
          ),
        false => await FlutterWebAuth2WindowsPlugin().authenticate(
            url: codeUri.toString(),
            callbackUrlScheme: callbackUrlScheme,
            preferEphemeral: true,
          ),
      };

      final code = Uri.parse(result).queryParameters['code'];
      final tokenUri = Uri.https(
        authHost,
        '/oauth2/token',
      );

      final options = Options(
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      );
      final response = await dio.postUri<Map<String, dynamic>>(
        tokenUri,
        data: {
          'client_id': clientId,
          'client_secret': clientSecret,
          'code': code,
          'grant_type': 'authorization_code',
          'redirect_uri': callbackUrlScheme,
        },
        options: options,
      );

      final accessToken = response.data!['access_token'];
      final user = (await getUserInfo(accessToken).run()).match(
        (l) => throw l,
        (r) => r,
      );

      final folderIdResult = await DropBox()
          .createFolder(
            folderName: none(),
            accessToken: accessToken,
            parentId: none(),
          )
          .run();

      return folderIdResult.match(
        (e) => throw e,
        (id) => AuthProviderModel(
          accessToken: accessToken,
          refreshToken: response.data!['refresh_token'],
          expiresIn: response.data!['expires_in'],
          provider: AuthProviderType.dropBox,
          email: user['email'],
          name: user['name']['display_name'],
          createdAt: DateTime.now().toIso8601String(),
          folderId: id,
        ),
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
        final uri = Uri.https(authHost, '/oauth2/token');
        final response = await dio.postUri<Map<String, dynamic>>(
          uri,
          data: {
            'client_id': clientId,
            'client_secret': clientSecret,
            'grant_type': 'refresh_token',
            'redirect_uri': callbackUrlScheme,
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
      final uri = Uri.https(apiHost, '/2/users/get_current_account');
      final response = await dio.postUri<Map<String, dynamic>>(
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

    final uri = Uri.https(apiHost, '/2/users/get_space_usage');

    return TaskEither.tryCatch(
      () async {
        final response = await dio.postUri<Map<String, dynamic>>(
          uri,
          options: authOptions,
        );

        return DriveInfoModel(
          remainingStorage: (response.data!['allocation']['allocated'] as int) -
              (response.data!['used'] as int),
          usedStorage: response.data!['used'],
          totalStorage: response.data!['allocation']['allocated'] as int,
        );
      },
      (error, stackTrace) => error.segregateError(),
    );
  }
}

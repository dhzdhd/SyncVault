import 'dart:io';

import 'package:dio/dio.dart';

import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:syncvault/log.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';
import 'package:syncvault/src/accounts/models/drive_info_model.dart';
import 'package:syncvault/src/accounts/services/auth_service.dart';
import 'package:syncvault/src/accounts/services/drive/onedrive.dart';
import 'package:syncvault/errors.dart';

final _dio = GetIt.I<Dio>();

@singleton
final class OneDriveAuth implements AuthService {
  static const clientId = '591486db-4bcc-46b7-ad21-45a6c59cfa26';
  static final callbackUrlScheme = Platform.isAndroid
      ? 'msauth://com.example.syncvault/mf%2BaFV5Ps1q90nV2hXuUBpjGfXo%3D'
      : 'http://localhost:8006';
  static const apiHost = 'graph.microsoft.com';
  static const authHost = 'login.microsoftonline.com';

  @override
  TaskEither<AppError, AuthProviderModel> signIn() {
    final codeUri = Uri.https(
      authHost,
      '/common/oauth2/v2.0/authorize',
      {
        'client_id': clientId,
        'response_type': 'code',
        'redirect_uri': callbackUrlScheme,
        'response_mode': 'query',
        'scope': 'offline_access files.readwrite.all user.read',
        'state': '12345',
      },
    );

    return TaskEither.tryCatch(() async {
      final result = switch (Platform.isAndroid) {
        true => await FlutterWebAuth2.authenticate(
            url: codeUri.toString(),
            callbackUrlScheme: 'msauth',
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
          )
      };

      final code = Uri.parse(result).queryParameters['code'];
      final tokenUri = Uri.https(
        authHost,
        '/common/oauth2/v2.0/token',
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
          'scope': 'offline_access files.readwrite.all user.read',
          'redirect_uri': callbackUrlScheme,
        },
        options: options,
      );

      final accessToken = response.data!['access_token'];
      final user = (await getUserInfo(accessToken).run()).match(
        (l) => throw l,
        (r) => r,
      );

      debugLogger.d(accessToken);

      final folderIdResult = await OneDrive()
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
          provider: AuthProviderType.oneDrive,
          email: user['mail'],
          name: user['displayName'],
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
        final uri = Uri.https(authHost, '/common/oauth2/v2.0/token');

        final response = await _dio.postUri<Map<String, dynamic>>(
          uri,
          data: {
            'client_id': clientId,
            'grant_type': 'refresh_token',
            'scope': 'offline_access files.readwrite.all user.read',
            'refresh_token': model.refreshToken,
          },
          options: options,
        );

        return model.copyWith(
          accessToken: response.data!['access_token'],
          expiresIn: response.data!['expires_in'],
          refreshToken: response.data!['refresh_token'],
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
      final uri = Uri.https(apiHost, '/beta/me');
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
  TaskEither<AppError, DriveInfoModel> getDriveInfo(
    String accessToken,
  ) {
    final authOptions = Options(headers: {
      'Authorization': 'Bearer $accessToken',
    });

    final uri = Uri.https(apiHost, '/beta/me/drive');

    return TaskEither.tryCatch(
      () async {
        final response = await _dio.getUri<Map<String, dynamic>>(
          uri,
          options: authOptions,
        );

        return DriveInfoModel(
          remainingStorage: response.data!['quota']['remaining'],
          usedStorage: response.data!['quota']['used'],
          totalStorage: response.data!['quota']['remaining'] +
              response.data!['quota']['used'],
        );
      },
      (error, stackTrace) => error.segregateError(),
    );
  }
}

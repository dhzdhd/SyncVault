import 'dart:io';

import 'package:dio/dio.dart';

import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:fpdart/fpdart.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';
import 'package:syncvault/src/accounts/models/folder_info_model.dart';
import 'package:syncvault/src/accounts/services/drive_service.dart';
import 'package:syncvault/errors.dart';

final dio = Dio();

abstract interface class AuthService {
  TaskEither<AppError, AuthProviderModel> signIn();
  TaskEither<AppError, AuthProviderModel> refresh(AuthProviderModel model);
  TaskEither<AppError, Map<String, dynamic>> getUserInfo(String accessToken);
  TaskEither<AppError, FolderInfoModel> getDriveInfo(String accessToken);
}

final class DropBoxAuth implements AuthService {
  static const clientId = 'ma42r73plfcdnrf';
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
          'client_secret': '',
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
            folderId: none(),
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
      return (error as Exception).segregate();
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
            'client_secret': '',
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
      return (error as Exception).segregate();
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
      return (error as Exception).segregate();
    });
  }

  @override
  TaskEither<AppError, FolderInfoModel> getDriveInfo(String accessToken) {
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

        return FolderInfoModel(
          remainingStorage: (response.data!['allocation']['allocated'] as int) -
              (response.data!['used'] as int),
          usedStorage: response.data!['used'],
        );
      },
      (error, stackTrace) => (error as Exception).segregate(),
    );
  }
}

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
            preferEphemeral: true,
          ),
        false => await FlutterWebAuth2WindowsPlugin().authenticate(
            url: codeUri.toString(),
            callbackUrlScheme: callbackUrlScheme,
            preferEphemeral: true,
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
      final response = await dio.postUri<Map<String, dynamic>>(
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

      final folderIdResult = await OneDrive()
          .createFolder(
            folderName: none(),
            accessToken: accessToken,
            folderId: none(),
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
      return (error as Exception).segregate();
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

        final response = await dio.postUri<Map<String, dynamic>>(
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
      return (error as Exception).segregate();
    });
  }

  @override
  TaskEither<AppError, Map<String, dynamic>> getUserInfo(String accessToken) {
    final authOptions = Options(headers: {
      'Authorization': 'Bearer $accessToken',
    });

    return TaskEither.tryCatch(() async {
      final uri = Uri.https(apiHost, '/beta/me');
      final response = await dio.getUri<Map<String, dynamic>>(
        uri,
        options: authOptions,
      );

      return response.data!;
    }, (error, stackTrace) {
      return (error as Exception).segregate();
    });
  }

  @override
  TaskEither<AppError, FolderInfoModel> getDriveInfo(
    String accessToken,
  ) {
    final authOptions = Options(headers: {
      'Authorization': 'Bearer $accessToken',
    });

    final uri = Uri.https(apiHost, '/beta/me/drive');

    return TaskEither.tryCatch(
      () async {
        final response = await dio.getUri<Map<String, dynamic>>(
          uri,
          options: authOptions,
        );

        return FolderInfoModel(
          remainingStorage: response.data!['quota']['remaining'],
          usedStorage: response.data!['quota']['used'],
        );
      },
      (error, stackTrace) => (error as Exception).segregate(),
    );
  }
}

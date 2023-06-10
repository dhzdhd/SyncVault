import 'dart:io';

import 'package:dio/dio.dart';

import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:fpdart/fpdart.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';
import 'package:syncvault/src/accounts/services/drive_service.dart';

final dio = Dio();

abstract interface class AuthService {
  Future<Either<String, AuthProviderModel>> signIn();
  Future<AuthProviderModel> refresh(AuthProviderModel model);
  Future<Map<String, dynamic>> getUserInfo(String accessToken);
  Future<dynamic> getDriveInfo(String accessToken);
  Future<void> test(AuthProviderModel model);
}

final class DropBoxAuth implements AuthService {
  static const clientId = "ma42r73plfcdnrf";
  static final callbackUrlScheme = Platform.isAndroid
      ? 'https://www.dropbox.com/1/oauth2/redirect_receiver'
      : 'http://localhost:8006';
  static const apiHost = "api.dropboxapi.com";
  static const authHost = "www.dropbox.com";

  @override
  Future<Either<String, AuthProviderModel>> signIn() async {
    final codeUri = Uri.https(
      authHost,
      "/oauth2/authorize",
      {
        "client_id": clientId,
        "response_type": "code",
        "redirect_uri": callbackUrlScheme,
        "scope": "openid files.content.read files.content.write profile",
        "state": "12345",
        "token_access_type": "offline",
      },
    );

    late final String result;
    if (Platform.isAndroid) {
      result = await FlutterWebAuth2.authenticate(
        url: codeUri.toString(),
        callbackUrlScheme: 'msauth',
        preferEphemeral: true,
      );
    } else {
      result = await FlutterWebAuth2WindowsPlugin().authenticate(
        url: codeUri.toString(),
        callbackUrlScheme: callbackUrlScheme,
        preferEphemeral: true,
      );
    }

    final code = Uri.parse(result).queryParameters['code'];
    final tokenUri = Uri.https(
      authHost,
      '/oauth2/token',
    );

    final options = Options(
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
    );
    final response = await dio.postUri<Map<String, dynamic>>(
      tokenUri,
      data: {
        "client_id": clientId,
        "client_secret": "",
        "code": code,
        "grant_type": "authorization_code",
        "scope": "openid files.content.read files.content.write profile",
        "redirect_uri": callbackUrlScheme,
      },
      options: options,
    );

    final accessToken = response.data!["access_token"];
    print(accessToken);

    throw UnimplementedError();
  }

  @override
  Future<AuthProviderModel> refresh(AuthProviderModel model) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getUserInfo(String accessToken) {
    throw UnimplementedError();
  }

  @override
  Future getDriveInfo(String accessToken) {
    throw UnimplementedError();
  }

  @override
  Future<void> test(AuthProviderModel model) {
    throw UnimplementedError();
  }
}

final class OneDriveAuth implements AuthService {
  static const clientId = "591486db-4bcc-46b7-ad21-45a6c59cfa26";
  static final callbackUrlScheme = Platform.isAndroid
      ? "msauth://com.example.syncvault/mf%2BaFV5Ps1q90nV2hXuUBpjGfXo%3D"
      : 'http://localhost:8006';
  static const apiHost = "graph.microsoft.com";
  static const authHost = "login.microsoftonline.com";

  @override
  Future<Either<String, AuthProviderModel>> signIn() async {
    final codeUri = Uri.https(
      authHost,
      "/common/oauth2/v2.0/authorize",
      {
        "client_id": clientId,
        "response_type": "code",
        "redirect_uri": callbackUrlScheme,
        "response_mode": "query",
        "scope": "offline_access files.readwrite.all user.read",
        "state": "12345",
      },
    );

    late final String result;
    if (Platform.isAndroid) {
      result = await FlutterWebAuth2.authenticate(
        url: codeUri.toString(),
        callbackUrlScheme: 'msauth',
        preferEphemeral: true,
      );
    } else {
      result = await FlutterWebAuth2WindowsPlugin().authenticate(
        url: codeUri.toString(),
        callbackUrlScheme: callbackUrlScheme,
        preferEphemeral: true,
      );
    }

    final code = Uri.parse(result).queryParameters['code'];
    final tokenUri = Uri.https(
      authHost,
      '/common/oauth2/v2.0/token',
    );

    final options = Options(
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
    );
    final response = await dio.postUri<Map<String, dynamic>>(
      tokenUri,
      data: {
        "client_id": clientId,
        "code": code,
        "grant_type": "authorization_code",
        "scope": "offline_access files.readwrite.all user.read",
        "redirect_uri": callbackUrlScheme,
      },
      options: options,
    );

    final accessToken = response.data!["access_token"];
    final user = await getUserInfo(accessToken);
    final drive = await getDriveInfo(accessToken);

    final folderIdResult = await OneDrive()
        .createFolder(
          folderName: none(),
          accessToken: accessToken,
          folderId: none(),
        )
        .run();

    return folderIdResult.map(
      (id) => AuthProviderModel(
        accessToken: accessToken,
        refreshToken: response.data!["refresh_token"],
        expiresIn: response.data!["expires_in"],
        provider: AuthProviderType.oneDrive,
        email: user["mail"],
        name: user["displayName"],
        createdAt: DateTime.now().toIso8601String(),
        remainingStorage: drive["quota"]["remaining"],
        usedStorage: drive["quota"]["used"],
        folderId: id,
      ),
    );
  }

  @override
  Future<AuthProviderModel> refresh(AuthProviderModel model) async {
    final prev = DateTime.parse(model.createdAt);
    final now = DateTime.now();
    final diff = prev.add(Duration(seconds: model.expiresIn)).compareTo(now);

    if (diff <= 0) {
      final options = Options(
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
      );
      final uri = Uri.https(authHost, '/common/oauth2/v2.0/token');
      final response = await dio.postUri<Map<String, dynamic>>(
        uri,
        data: {
          "client_id": clientId,
          "grant_type": "refresh_token",
          "scope": "offline_access files.readwrite.all user.read",
          "refresh_token": model.refreshToken,
        },
        options: options,
      );

      // print(response.data!["access_token"]);

      return model.copyWith(
        accessToken: response.data!["access_token"],
        expiresIn: response.data!["expires_in"],
        refreshToken: response.data!["refresh_token"],
      );
    } else {
      return model;
    }
  }

  @override
  Future<Map<String, dynamic>> getUserInfo(String accessToken) async {
    final authOptions = Options(headers: {
      "Authorization": "Bearer $accessToken",
    });

    final uri = Uri.https(apiHost, '/beta/me');
    final response = await dio.getUri<Map<String, dynamic>>(
      uri,
      options: authOptions,
    );

    return response.data!;
  }

  @override
  Future<Map<String, dynamic>> getDriveInfo(String accessToken) async {
    final authOptions = Options(headers: {
      "Authorization": "Bearer $accessToken",
    });

    final uri = Uri.https(apiHost, '/beta/me/drive');
    final response = await dio.getUri<Map<String, dynamic>>(
      uri,
      options: authOptions,
    );

    return response.data!;
  }

  @override
  Future<void> test(AuthProviderModel model) async {
    final authOptions = Options(headers: {
      "Authorization": "Bearer ${model.accessToken}",
    });

    final uri = Uri.https(apiHost, '/beta/drive');
    print(uri.toString());
    final response = await dio.getUri<Map<String, dynamic>>(
      uri,
      options: authOptions,
    );
    print(response.data);
  }
}

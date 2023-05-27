import 'dart:io';

import 'package:dio/dio.dart';

import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';

final dio = Dio();

abstract interface class CloudService {
  Future<AuthProviderModel> signIn();
  Future<void> signOut();
  Future<void> test(AuthProviderModel model);
}

final class GoogleDrive implements CloudService {
  @override
  Future<AuthProviderModel> signIn() async {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {
    throw UnimplementedError();
  }

  @override
  Future<void> test(AuthProviderModel model) {
    throw UnimplementedError();
  }
}

final class OneDrive implements CloudService {
  static const clientId = "591486db-4bcc-46b7-ad21-45a6c59cfa26";
  static final callbackUrlScheme = Platform.isAndroid
      ? "msauth://com.example.syncvault/mf%2BaFV5Ps1q90nV2hXuUBpjGfXo%3D"
      : 'http://localhost:8006';
  static const apiUrl = "graph.microsoft.com";
  static const authUrl = "login.microsoftonline.com";

  @override
  Future<AuthProviderModel> signIn() async {
    final codeUri = Uri.https(
      authUrl,
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
      authUrl,
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
    final model = AuthProviderModel(
      accessToken: accessToken,
      refreshToken: response.data!["refresh_token"],
      expiresIn: response.data!["expires_in"],
      provider: AuthProvider.oneDrive,
      email: user["mail"],
      name: user["displayName"],
    );
    print(user.toString());

    return model;
  }

  Future<Map<String, dynamic>> getUserInfo(String accessToken) async {
    final authOptions = Options(headers: {
      "Authorization": "Bearer $accessToken",
    });
    // print(accessToken);
    final uri = Uri.https(apiUrl, '/beta/me');
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

    final uri = Uri.https(apiUrl, '/beta/drive');
    print(uri.toString());
    final response = await dio.getUri<Map<String, dynamic>>(
      uri,
      options: authOptions,
    );
    print(response.data);
  }

  @override
  Future<void> signOut() async {
    throw UnimplementedError();
  }
}

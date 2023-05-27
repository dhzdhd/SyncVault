import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

final dio = Dio();

abstract interface class CloudService {
  Future<void> signIn();
  Future<void> signOut();
  Future<void> test();
}

final class GoogleDrive implements CloudService {
  @override
  Future<void> signIn() async {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {
    throw UnimplementedError();
  }

  @override
  Future<void> test() {
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
  late final String accessToken;

  @override
  Future<void> signIn() async {
    final codeUri = Uri.https(
      authUrl,
      "/common/oauth2/v2.0/authorize",
      {
        "client_id": clientId,
        "response_type": "code",
        "redirect_uri": callbackUrlScheme,
        "response_mode": "query",
        "scope": "offline_access files.readwrite.all",
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

    try {
      final options = Options(
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
      );
      final response = await dio.postUri<Map<String, dynamic>>(
        tokenUri,
        data: {
          "client_id": clientId,
          "code": code,
          "grant_type": "authorization_code",
          "scope": "offline_access files.readwrite.all",
          "redirect_uri": callbackUrlScheme,
        },
        options: options,
      );

      accessToken = response.data!["access_token"];
      print(accessToken);
      final refreshToken = response.data!["refresh_token"];
      final expiresIn = response.data!["expires_in"];

      test();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<void> test() async {
    final authOptions = Options(headers: {
      "Authorization": "Bearer $accessToken",
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

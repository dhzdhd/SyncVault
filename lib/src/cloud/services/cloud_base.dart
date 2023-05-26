import 'package:dio/dio.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

final dio = Dio();

abstract interface class CloudService {
  Future<void> signIn(final String username, final String password);
  Future<void> signOut(final String username, final String password);
}

final class GoogleDrive implements CloudService {
  @override
  Future<void> signIn(String username, String password) async {}

  @override
  Future<void> signOut(String username, String password) async {}
}

final class OneDrive implements CloudService {
  static const clientId = "591486db-4bcc-46b7-ad21-45a6c59cfa26";
  static const callbackUrlScheme =
      "https://login.microsoftonline.com/common/oauth2/nativeclient";
  static const apiUrl = "https://graph.microsoft.com/beta";
  static const authUrl = "login.microsoftonline.com";

  @override
  Future<void> signIn(String username, String password) async {
    final codeUri = Uri.https(
      authUrl,
      "/common/oauth2/v2.0/authorize",
      {
        "client_id": clientId,
        "response_type": "code",
        "redirect_uri": "http://localhost:8006",
        "response_mode": "query",
        "scope": "offline_access files.readwrite.all",
        "state": "12345",
      },
    );

    final result = await FlutterWebAuth2WindowsPlugin().authenticate(
      url: codeUri.toString(),
      callbackUrlScheme: 'http://localhost:8006',
      preferEphemeral: true,
    );
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
          "redirect_uri": "http://localhost:8006",
        },
        options: options,
      );

      final accessToken = response.data!["access_token"];
      print(accessToken);
      final refreshToken = response.data!["refresh_token"];
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<void> signOut(String username, String password) async {}

  void get() {}
}

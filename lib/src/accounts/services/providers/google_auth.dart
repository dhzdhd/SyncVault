import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/helpers.dart';
import 'package:syncvault/src/accounts/models/drive_info_model.dart';
import 'package:syncvault/src/accounts/services/common.dart';
import 'package:syncvault/src/common/models/drive_provider.dart';
import 'package:syncvault/src/home/models/drive_provider_backend.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:get_it/get_it.dart';

final _dio = GetIt.I<Dio>();

@singleton
class GoogleAuthService implements ManualAuthService {
  static final _clientId = PlatformExtension.isMobile
      ? '844110357681-4sa1ev4ep3thlfa5gq3l4pjigvv3n98q.apps.googleusercontent.com'
      : '844110357681-uf9kcigbrju05jhebrr58388b3ij299d.apps.googleusercontent.com';
  static final _callbackUrlScheme = PlatformExtension.isMobile
      ? 'com.googleusercontent.apps.844110357681-4sa1ev4ep3thlfa5gq3l4pjigvv3n98q'
      : 'http://localhost:8006';
  static const _authHost = 'accounts.google.com';
  // static final _clientSecret = dotenv.env['GDRIVE_SECRET']!;
  // TODO: Different for mobile and desktop
  static const _clientSecret = '';
  static const _apiHost = 'www.googleapis.com';

  final _codeUri = Uri.https(
    _authHost,
    '/o/oauth2/v2/auth',
    {
      'client_id': _clientId,
      'response_type': 'code',
      'redirect_uri':
          Platform.isAndroid ? '$_callbackUrlScheme:/' : _callbackUrlScheme,
      'scope':
          'https://www.googleapis.com/auth/drive.file https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email',
      'state': '12345',
      'access_type': 'offline',
      'prompt': 'select_account consent',
    },
  );

  @override
  TaskEither<AppError, DriveProviderModel> authorize({
    required DriveProviderBackend backend,
    required DriveProvider driveProvider,
    required String remoteName,
  }) {
    if (driveProvider.backendType != OAuth2) {
      return TaskEither.left(const AppError.general('Only OAuth2 supported'));
    }

    return TaskEither.tryCatch(() async {
      final result = await FlutterWebAuth2.authenticate(
        url: _codeUri.toString(),
        callbackUrlScheme: _callbackUrlScheme,
        options: const FlutterWebAuth2Options(
          useWebview: false,
          intentFlags: ephemeralIntentFlags,
        ),
      );

      final code = Uri.parse(result).queryParameters['code'];

      final tokenUri = Uri.https(
        _apiHost,
        '/oauth2/v4/token',
      );

      final options = Options(
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      );
      final response = await _dio.postUri<Map<String, dynamic>>(
        tokenUri,
        data: {
          'client_id': _clientId,
          'code': code,
          'grant_type': 'authorization_code',
          if (PlatformExtension.isDesktop) 'client_secret': _clientSecret,
          'redirect_uri': _callbackUrlScheme,
        },
        options: options,
      );

      final accessToken = response.data!['access_token'];
      final refreshToken = response.data!['refresh_token'];
      final expiresIn = response.data!['expires_in'];

      return DriveProviderModel(
        remoteName: remoteName,
        provider: DriveProvider.googleDrive,
        backend: OAuth2(
          authJson: {},
          accessToken: accessToken,
          refreshToken: refreshToken,
          expiresIn: expiresIn.toString(),
        ),
        createdAt: DateTime.now().toIso8601String(),
        updatedAt: DateTime.now().toIso8601String(),
        isRCloneBackend: false,
      );
    }, (err, st) => err.handleError('Google auth failed', st));
  }

  @override
  TaskEither<AppError, Option<DriveInfoModel>> driveInfo({
    required DriveProviderModel model,
  }) {
    final backend = model.backend as OAuth2;
    final authOptions = Options(headers: {
      'Authorization': 'Bearer ${backend.accessToken}',
    });

    final uri =
        Uri.https(_apiHost, '/drive/v3/about', {'fields': 'storageQuota'});

    return TaskEither.tryCatch(
      () async {
        final response = await _dio.getUri<Map<String, dynamic>>(
          uri,
          options: authOptions,
        );

        return some(DriveInfoModel(
          remainingStorage: some(
              int.parse(response.data!['storageQuota']['limit']) -
                  int.parse(response.data!['storageQuota']['usage'])),
          usedStorage: some(int.parse(response.data!['storageQuota']['usage'])),
          totalStorage:
              some(int.parse(response.data!['storageQuota']['limit'])),
        ));
      },
      (error, stackTrace) =>
          error.handleError('Gdrive info cannot be fetched', StackTrace.empty),
    );
  }

  @override
  TaskEither<AppError, DriveProviderModel> refresh(
      {required DriveProviderModel model}) {
    return TaskEither.tryCatch(
      () async {
        // final backend = model.backend as OAuth2;

        // final prev = DateTime.parse(model.createdAt);
        // final now = DateTime.now();
        // final diff =
        //     prev.add(Duration(seconds: model.expiresIn)).compareTo(now);

        // if (diff <= 0) {
        //   final options = Options(
        //     headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        //   );
        //   final uri = Uri.https(
        //     _apiHost,
        //     '/oauth2/v4/token',
        //   );
        //   final response = await _dio.postUri<Map<String, dynamic>>(
        //     uri,
        //     data: {
        //       'client_id': _clientId,
        //       'grant_type': 'refresh_token',
        //       // if (Platform.isWindows) 'client_secret': clientSecret,
        //       'redirect_uri': _callbackUrlScheme,
        //       'refresh_token': backend.refreshToken,
        //     },
        //     options: options,
        //   );

        //   return model.copyWith(
        //     accessToken: response.data!['access_token'],
        //     expiresIn: response.data!['expires_in'],
        //   );
        // } else {
        //   return model;
        // }

        throw UnimplementedError();
      },
      (err, st) => err.handleError('Failed to refresh gdrive token', st),
    );
  }

  @override
  TaskEither<AppError, Map<String, dynamic>> getUserInfo(
      {required String accessToken}) {
    final authOptions = Options(headers: {
      'Authorization': 'Bearer $accessToken',
    });

    return TaskEither.tryCatch(() async {
      final uri = Uri.https(_apiHost, '/oauth2/v2/userinfo');
      final response = await _dio.getUri<Map<String, dynamic>>(
        uri,
        options: authOptions,
      );

      return response.data!;
    }, (error, stackTrace) {
      return error.handleError('', StackTrace.empty);
    });
  }
}

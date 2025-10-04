import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/extensions.dart';
import 'package:syncvault/src/accounts/models/drive_info_model.dart';
import 'package:syncvault/src/accounts/services/common.dart';
import 'package:syncvault/src/common/services/providers/google_utils.dart';
import 'package:syncvault/src/home/models/drive_provider.dart';
import 'package:syncvault/src/home/models/drive_provider_backend.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:get_it/get_it.dart';

final _dio = GetIt.I<Dio>();

@singleton
class GoogleAuthService implements ManualAuthService {
  final _codeUri = Uri.https(GoogleUtils.authHost, '/o/oauth2/v2/auth', {
    'client_id': GoogleUtils.clientId,
    'response_type': 'code',
    'redirect_uri': GoogleUtils.callbackUrlScheme,
    'scope': GoogleUtils.scopesString,
    'state': '12345',
    'access_type': 'offline',
    'prompt': 'select_account consent',
  });

  @override
  TaskEither<AppError, RemoteProviderModel> authorize({
    required DriveProviderBackend backend,
    required DriveProvider driveProvider,
    required String remoteName,
  }) {
    if (backend is! OAuth2) {
      return TaskEither.left(
        const GeneralError('Only OAuth2 supported', null, null),
      );
    }

    return TaskEither.tryCatch(
      () async {
        final result = await FlutterWebAuth2.authenticate(
          url: _codeUri.toString(),
          callbackUrlScheme: GoogleUtils.callbackUrlScheme,
          options: const FlutterWebAuth2Options(
            useWebview: false,
            intentFlags: ephemeralIntentFlags,
          ),
        );

        final code = Uri.parse(result).queryParameters['code'];

        final tokenUri = Uri.https(GoogleUtils.apiHost, '/oauth2/v4/token');

        final options = Options(
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        );
        final response = await _dio.postUri<Map<String, dynamic>>(
          tokenUri,
          data: {
            'client_id': GoogleUtils.clientId,
            'code': code,
            'grant_type': 'authorization_code',
            if (PlatformExtension.isDesktop)
              'client_secret': GoogleUtils.clientSecret,
            'redirect_uri': GoogleUtils.callbackUrlScheme,
          },
          options: options,
        );

        final accessToken = response.data!['access_token'];
        final refreshToken = response.data!['refresh_token'];
        final expiresIn = response.data!['expires_in'];

        return RemoteProviderModel(
          remoteName: remoteName,
          provider: GoogleDriveProvider(),
          backend: OAuth2(
            authJson: {
              'access_token': accessToken,
              'token_type': 'Bearer',
              'refresh_token': refreshToken,
              'expiry': expiresIn.toString(),
            },
            accessToken: accessToken,
            refreshToken: refreshToken,
            expiresIn: expiresIn.toString(),
          ),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          isRCloneBackend: false,
        );
      },
      (err, st) => ProviderError(
        driveProvider,
        ProviderOperationType.authorize,
        err,
        st,
      ),
    );
  }

  @override
  TaskEither<AppError, Option<DriveInfoModel>> driveInfo({
    required RemoteProviderModel model,
  }) {
    final backend = model.backend as OAuth2;
    final authOptions = Options(
      headers: {'Authorization': 'Bearer ${backend.accessToken}'},
    );

    final uri = Uri.https(GoogleUtils.apiHost, '/drive/v3/about', {
      'fields': 'storageQuota',
    });

    return TaskEither.tryCatch(
      () async {
        final response = await _dio.getUri<Map<String, dynamic>>(
          uri,
          options: authOptions,
        );

        return some(
          DriveInfoModel(
            remainingStorage: some(
              int.parse(response.data!['storageQuota']['limit']) -
                  int.parse(response.data!['storageQuota']['usage']),
            ),
            usedStorage: some(
              int.parse(response.data!['storageQuota']['usage']),
            ),
            totalStorage: some(
              int.parse(response.data!['storageQuota']['limit']),
            ),
          ),
        );
      },
      (error, stackTrace) => ProviderError(
        model.provider,
        ProviderOperationType.getDriveInfo,
        error,
        stackTrace,
      ),
    );
  }

  @override
  TaskEither<AppError, RemoteProviderModel> refresh({
    required RemoteProviderModel model,
  }) {
    return TaskEither.tryCatch(
      () async {
        final backend = model.backend as OAuth2;

        final prev = model.updatedAt;
        final now = DateTime.now();
        final diff = prev
            .add(Duration(seconds: int.parse(backend.expiresIn)))
            .compareTo(now);

        if (diff <= 0) {
          final options = Options(
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          );
          final uri = Uri.https(GoogleUtils.apiHost, '/oauth2/v4/token');
          final response = await _dio.postUri<Map<String, dynamic>>(
            uri,
            data: {
              'client_id': GoogleUtils.clientId,
              'grant_type': 'refresh_token',
              if (PlatformExtension.isDesktop)
                'client_secret': GoogleUtils.clientSecret,
              'redirect_uri': GoogleUtils.callbackUrlScheme,
              'refresh_token': backend.refreshToken,
            },
            options: options,
          );

          return model.copyWith(
            backend: backend.copyWith(
              accessToken: response.data!['access_token'],
              expiresIn: response.data!['expires_in'].toString(),
            ),
            updatedAt: DateTime.now(),
          );
        } else {
          return model;
        }
      },
      (err, st) => ProviderError(
        model.provider,
        ProviderOperationType.authorize,
        err,
        st,
      ),
    );
  }

  @override
  TaskEither<AppError, Map<String, dynamic>> getUserInfo({
    required String accessToken,
  }) {
    final authOptions = Options(
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    return TaskEither.tryCatch(
      () async {
        final uri = Uri.https(GoogleUtils.apiHost, '/oauth2/v2/userinfo');
        final response = await _dio.getUri<Map<String, dynamic>>(
          uri,
          options: authOptions,
        );

        return response.data!;
      },
      (error, stackTrace) => ProviderError(
        GoogleDriveProvider(),
        ProviderOperationType.authorize,
        error,
        stackTrace,
      ),
    );
  }

  @override
  TaskEither<AppError, bool> isHealthy({required DriveProviderModel model}) {
    // TODO: implement isHealthy
    throw UnimplementedError();
  }
}

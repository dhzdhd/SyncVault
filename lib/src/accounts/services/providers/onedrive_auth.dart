import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/accounts/models/drive_info_model.dart';
import 'package:syncvault/src/accounts/services/common.dart';
import 'package:syncvault/src/home/models/drive_provider.dart';
import 'package:syncvault/src/home/models/drive_provider_backend.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';

final _dio = GetIt.I<Dio>();

@singleton
class OneDriveAuthService implements ManualAuthService {
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
        throw UnimplementedError();
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
    // TODO: implement driveInfo
    throw UnimplementedError();
  }

  @override
  TaskEither<AppError, Map<String, dynamic>> getUserInfo({
    required String accessToken,
  }) {
    // TODO: implement getUserInfo
    throw UnimplementedError();
  }

  @override
  TaskEither<AppError, bool> isHealthy({required RemoteProviderModel model}) {
    // TODO: implement isHealthy
    throw UnimplementedError();
  }

  @override
  TaskEither<AppError, RemoteProviderModel> refresh({
    required RemoteProviderModel model,
  }) {
    // TODO: implement refresh
    throw UnimplementedError();
  }
}

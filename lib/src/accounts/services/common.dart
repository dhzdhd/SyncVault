import 'package:fpdart/fpdart.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/accounts/models/drive_info_model.dart';
import 'package:syncvault/src/home/models/drive_provider.dart';
import 'package:syncvault/src/home/models/drive_provider_backend.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';

abstract interface class AuthService {
  TaskEither<AppError, RemoteProviderModel> authorize({
    required DriveProviderBackend backend,
    required DriveProvider driveProvider,
    required String remoteName,
  });
  TaskEither<AppError, Option<DriveInfoModel>> driveInfo({
    required RemoteProviderModel model,
  });
  TaskEither<AppError, bool> isHealthy({required RemoteProviderModel model});
}

abstract interface class ManualAuthService extends AuthService {
  TaskEither<AppError, RemoteProviderModel> refresh({
    required RemoteProviderModel model,
  });
  TaskEither<AppError, Map<String, dynamic>> getUserInfo({
    required String accessToken,
  });
}

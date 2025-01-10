import 'package:fpdart/fpdart.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/accounts/models/drive_info_model.dart';
import 'package:syncvault/src/common/models/drive_provider.dart';
import 'package:syncvault/src/home/models/drive_provider_backend.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';

abstract interface class AuthService {
  TaskEither<AppError, DriveProviderModel> authorize({
    required DriveProviderBackend backend,
    required DriveProvider driveProvider,
    required String remoteName,
  });
  TaskEither<AppError, Option<DriveInfoModel>> driveInfo({
    required DriveProviderModel model,
  });
}

abstract interface class ManualAuthService {}

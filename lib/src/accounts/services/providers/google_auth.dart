import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/common/models/drive_provider.dart';
import 'package:syncvault/src/home/models/drive_provider_backend.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';

@singleton
class GoogleAuthService {
  TaskEither<AppError, DriveProviderModel> authorize({
    required OAuth2 backend,
    required DriveProvider driveProvider,
    required String remoteName,
  }) {
    if (driveProvider.backendType != OAuth2) {
      return TaskEither.left(const AppError.general('Only OAuth2 supported'));
    }

    return TaskEither.tryCatch(() async {
      throw UnimplementedError();
    }, (err, st) => err.handleError('Google auth failed', st));
  }
}

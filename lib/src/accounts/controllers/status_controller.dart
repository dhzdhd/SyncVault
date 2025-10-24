import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/services/rclone.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';

part 'status_controller.g.dart';

@riverpod
Future<bool> connectionStatus(Ref ref, DriveProviderModel model) async {
  return switch ((model as RemoteProviderModel).isRCloneBackend) {
    true => (await RCloneAuthService().isHealthy(model: model).run()).getOrElse(
      (err) => false,
    ),
    false => () async {
      final service = getManualAuthService(model.provider);

      final result = await TaskEither<AppError, bool>.Do(($) async {
        final refreshedModel = await $(service.refresh(model: model));
        final isHealthy = await $(service.isHealthy(model: refreshedModel));

        return isHealthy;
      }).run();

      return result.any((res) => res);
    }(),
  };
}

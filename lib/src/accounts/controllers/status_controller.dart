import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncvault/src/accounts/services/rclone.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';

part 'status_controller.g.dart';

@riverpod
Future<bool> connectionStatus(Ref ref, DriveProviderModel model) async {
  return switch ((model as RemoteProviderModel).isRCloneBackend) {
    true => (await RCloneAuthService().isHealthy(model: model).run()).getOrElse(
      (err) => false,
    ),
    // TODO: Support manual
    false => false,
  };
}

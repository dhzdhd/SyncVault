import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/errors.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncvault/src/home/models/drive_provider_backend_payload.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';
import 'package:syncvault/src/home/services/rclone.dart';

part 'auth_controller.g.dart';

// The AsyncValue controller to provide states to UI
@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {}

  Future<void> signIn(
      DriveProviderBackendPayload payload, DriveProvider provider) async {
    final authNotifier = ref.read(authProvider.notifier);

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => authNotifier.signIn(payload, provider),
    );
  }
}

@riverpod
Future<String> driveInfoController(
  Ref ref,
  DriveProviderModel model,
) async {
  final authNotifier = ref.read(authProvider.notifier);

  return authNotifier.getDriveInfo(model);
}

final _box = GetIt.I<Box<DriveProviderModel>>();

// The actual repository to handle backend API calls
// Called from the controller
@riverpod
class Auth extends _$Auth {
  @override
  List<DriveProviderModel> build() {
    return init();
  }

  static List<DriveProviderModel> init() {
    return _box.values.toList();
  }

  Future<void> signIn(
      DriveProviderBackendPayload payload, DriveProvider provider) async {
    final service = await RCloneAuthService()
        .authorize(payload: payload, driveProvider: provider)
        .run();

    service.match(
      (l) => throw l,
      (model) async {
        if (state.any((element) => element.remoteName == model.remoteName)) {
          throw const GeneralError(
            'The provider already exists',
          );
        }

        state = [...state, model];
        // TODO: account box is redundant as rclone config exists
        await _box.put(model.remoteName, model);
      },
    );
  }

  // TODO: Add functionality to delete folders
  Future<void> signOut(DriveProviderModel model) async {
    state = state.where((element) => element != model).toList();
    await _box.delete(model.remoteName);
  }

  Future<String> getDriveInfo(
    DriveProviderModel model,
  ) async {
    // TODO: Create union or use drive info model itself with nullable fields
    return switch (model.provider) {
      DriveProvider.dropBox => '',
      DriveProvider.oneDrive => '',
      DriveProvider.googleDrive => '',
      _ => '',
    };
  }
}

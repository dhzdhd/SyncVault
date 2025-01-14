import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/errors.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncvault/src/accounts/models/drive_info_model.dart';
import 'package:syncvault/src/accounts/services/common.dart';
import 'package:syncvault/src/accounts/services/providers/google_auth.dart';
import 'package:syncvault/src/accounts/services/rclone.dart';
import 'package:syncvault/src/common/models/drive_provider.dart';
import 'package:syncvault/src/home/models/drive_provider_backend.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';
import 'package:syncvault/src/settings/controllers/settings_controller.dart';

part 'auth_controller.g.dart';

// The AsyncValue controller to provide states to UI
@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {}

  Future<void> signIn(DriveProviderBackend backend, DriveProvider provider,
      String remoteName) async {
    final authNotifier = ref.read(authProvider.notifier);

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => authNotifier.signIn(backend, provider, remoteName),
    );
  }
}

@riverpod
Future<DriveInfoModel> driveInfoController(
  Ref ref,
  DriveProviderModel model,
) async {
  final authNotifier = ref.read(authProvider.notifier);

  return authNotifier.getDriveInfo(model);
}

final _box = GetIt.I<Box<DriveProviderModel>>();

// The actual service to handle backend API calls
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

  ManualAuthService getManualAuthService(DriveProvider provider) {
    return switch (provider) {
      DriveProvider.googleDrive => GoogleAuthService(),
      _ => throw UnimplementedError(),
    };
  }

  Future<void> signIn(
    DriveProviderBackend backend,
    DriveProvider provider,
    String remoteName,
  ) async {
    final settings = ref.watch(settingsProvider);

    if (state.any((element) => element.remoteName == remoteName)) {
      throw const GeneralError(
        'The provider already exists',
      );
    }

    final service = switch (settings.isRCloneDefault) {
      true => await RCloneAuthService()
          .authorize(
              backend: backend, driveProvider: provider, remoteName: remoteName)
          .run(),
      false => await getManualAuthService(provider)
          .authorize(
              backend: backend, driveProvider: provider, remoteName: remoteName)
          .run()
    };

    service.match(
      (l) => throw l,
      (model) async {
        state = [...state, model];
        // TODO: account box is redundant as rclone config exists
        await _box.put(model.remoteName, model);
      },
    );
  }

  // TODO: Add functionality to delete folders & remove corresponding rclone config
  Future<void> signOut(DriveProviderModel model) async {
    state = state.where((element) => element != model).toList();
    await _box.delete(model.remoteName);
  }

  Future<DriveInfoModel> getDriveInfo(
    DriveProviderModel model,
  ) async {
    final result = switch (model.isRCloneBackend) {
      true => await RCloneAuthService().driveInfo(model: model).run(),
      false => await getManualAuthService(model.provider)
          .refresh(model: model)
          .flatMap((res) =>
              getManualAuthService(model.provider).driveInfo(model: res))
          .run()
    };

    return result.match(
      (err) => throw err,
      (t) => t.match(
        () => throw const GeneralError('Could not fetch drive info'),
        (s) => s,
      ),
    );
  }
}

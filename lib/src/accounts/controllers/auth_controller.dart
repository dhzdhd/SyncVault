import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ini_v2/ini.dart';
import 'package:syncvault/errors.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncvault/src/accounts/models/drive_info_model.dart';
import 'package:syncvault/src/accounts/services/common.dart';
import 'package:syncvault/src/accounts/services/providers/google_auth.dart';
import 'package:syncvault/src/accounts/services/rclone.dart';
import 'package:syncvault/src/common/services/rclone.dart';
import 'package:syncvault/src/home/models/drive_provider.dart';
import 'package:syncvault/src/home/models/drive_provider_backend.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';

part 'auth_controller.g.dart';

// The AsyncValue controller to provide states to UI
@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {}

  Future<void> signIn(
    DriveProviderBackend backend,
    DriveProvider provider,
    String remoteName,
    bool isRCloneBackend,
  ) async {
    final authNotifier = ref.read(authProvider.notifier);

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => authNotifier.signIn(backend, provider, remoteName, isRCloneBackend),
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
  Future<List<DriveProviderModel>> build() async {
    // TODO: Change all instances of requireValue to switch cases
    state = AsyncData(_box.values.toList());
    return init();
  }

  static Future<List<DriveProviderModel>> init() async {
    final val = await RCloneUtils().parseModelFromConfig().run();
    return val
        .map(
          (providers) => [
            ...providers,
            ..._box.values.filter((provider) => !provider.isRCloneBackend),
          ],
        )
        .getOrElse((_) => _box.values.toList());
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
    bool isRCloneBackend,
  ) async {
    if (state.requireValue.any((element) => element.remoteName == remoteName)) {
      throw const GeneralError('The provider already exists', null, null);
    }

    final service = switch (backend is Local) {
      true => Right<AppError, DriveProviderModel>(
        DriveProviderModel(
          backend: backend,
          remoteName: remoteName,
          provider: provider,
          createdAt: DateTime.now().toIso8601String(),
          updatedAt: DateTime.now().toIso8601String(),
          isRCloneBackend: isRCloneBackend,
        ),
      ),
      false => switch (isRCloneBackend) {
        true =>
          await RCloneAuthService()
              .authorize(
                backend: backend,
                driveProvider: provider,
                remoteName: remoteName,
              )
              .run(),
        false =>
          await getManualAuthService(provider)
              .authorize(
                backend: backend,
                driveProvider: provider,
                remoteName: remoteName,
              )
              .run(),
      },
    };

    service.match(
      (err) {
        throw GeneralError(
          'Failed to authorize',
          err,
          err.stackTrace,
        ).logError();
      },
      (model) async {
        state = AsyncData([...state.requireValue, model]);
        // TODO: account box is redundant as rclone config exists
        await _box.put(model.remoteName, model);
      },
    );
  }

  // TODO: Add functionality to delete folders
  Future<void> signOut(DriveProviderModel model) async {
    state = AsyncData(
      state.requireValue.where((element) => element != model).toList(),
    );
    await _box.delete(model.remoteName);

    // TODO: Refactor to getIniConfig
    if (model.isRCloneBackend) {
      final configFileRes = await RCloneUtils().getConfig().run();
      final configFile = configFileRes.toOption().toNullable()!;

      final config = Config.fromString(await configFile.readAsString());
      config.removeSection(model.remoteName);

      await configFile.writeAsString(config.toString());
    }
  }

  Future<DriveInfoModel> getDriveInfo(DriveProviderModel model) async {
    final result = switch (model.isRCloneBackend) {
      true => await RCloneAuthService().driveInfo(model: model).run(),
      false =>
        await getManualAuthService(model.provider)
            .refresh(model: model)
            .flatMap(
              (res) =>
                  getManualAuthService(model.provider).driveInfo(model: res),
            )
            .run(),
    };

    return result.match(
      (err) => throw err,
      (t) => t.match(
        () =>
            throw const GeneralError('Could not fetch drive info', null, null),
        (s) => s,
      ),
    );
  }
}

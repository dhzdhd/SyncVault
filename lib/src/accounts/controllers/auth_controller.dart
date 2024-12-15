import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:hive_ce/hive.dart';
import 'package:syncvault/log.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';
import 'package:syncvault/src/accounts/models/drive_info_model.dart';
import 'package:syncvault/src/accounts/services/auth/dropbox.dart';
import 'package:syncvault/src/accounts/services/auth/gdrive.dart';
import 'package:syncvault/src/accounts/services/auth/onedrive.dart';
import 'package:syncvault/errors.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

enum AuthProviderType {
  oneDrive,
  dropBox,
  googleDrive,
}

// The AsyncValue controller to provide states to UI
@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {}

  Future<void> signIn(AuthProviderType provider) async {
    final authNotifier = ref.read(authProvider.notifier);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authNotifier.signIn(provider));
  }
}

@riverpod
Future<DriveInfoModel> driveInfoController(
  DriveInfoControllerRef ref,
  AuthProviderModel model,
) async {
  final authNotifier = ref.read(authProvider.notifier);

  return authNotifier.getDriveInfo(model);
}

// The actual repository to handle backend API calls
// Called from the controller
@riverpod
class Auth extends _$Auth {
  @override
  List<AuthProviderModel> build() {
    return init();
  }

  static List<AuthProviderModel> init() {
    const List<AuthProviderModel> defaultValue = [];

    final List<dynamic> raw = jsonDecode(Hive.box('vault')
        .get('accounts', defaultValue: defaultValue.toString()));

    try {
      return raw.map((e) => AuthProviderModel.fromJson(e)).toList();
    } catch (e) {
      // TODO: Log to sentry
      debugLogger.e('Failed to parse local accounts data', error: e);
      fileLogger.e('Failed to parse local accounts data', error: e);

      return defaultValue;
    }
  }

  Future<void> signIn(AuthProviderType provider) async {
    final service = await switch (provider) {
      AuthProviderType.oneDrive => OneDriveAuth().signIn(),
      AuthProviderType.dropBox => DropBoxAuth().signIn(),
      AuthProviderType.googleDrive => GoogleDriveAuth().signIn(),
    }
        .run();

    service.match(
      (l) => throw l,
      (model) {
        if (state.any(
          (element) =>
              element.provider == model.provider &&
              element.email == model.email,
        )) {
          throw const GeneralError(
            'The provider already exists',
          );
        }

        state = [...state, model];

        Hive.box('vault').put(
          'accounts',
          jsonEncode(state.map((e) => e.toJson()).toList()),
        );
      },
    );
  }

  TaskEither<AppError, AuthProviderModel> refresh(AuthProviderModel model) {
    return switch (model.provider) {
      AuthProviderType.oneDrive => OneDriveAuth().refresh(model),
      AuthProviderType.dropBox => DropBoxAuth().refresh(model),
      AuthProviderType.googleDrive => GoogleDriveAuth().refresh(model),
    }
        .map(
      (r) {
        state = [...state, r].where((e) => e != model).sortBy(
              Order.by(
                (a) => DateTime.parse(a.createdAt),
                Order.orderDate,
              ),
            );
        return r;
      },
    );
  }

  // TODO: Add functionality to delete folders
  void signOut(AuthProviderModel model) async {
    state = state.where((element) => element != model).toList();
    Hive.box('vault').put(
      'accounts',
      jsonEncode(state.map((e) => e.toJson()).toList()),
    );
  }

  Future<DriveInfoModel> getDriveInfo(
    AuthProviderModel model,
  ) async {
    return await (await refresh(model).run())
        .bindFuture((e) async {
          return switch (e.provider) {
            AuthProviderType.oneDrive =>
              await OneDriveAuth().getDriveInfo(e.accessToken).run(),
            AuthProviderType.dropBox =>
              await DropBoxAuth().getDriveInfo(e.accessToken).run(),
            AuthProviderType.googleDrive =>
              await GoogleDriveAuth().getDriveInfo(e.accessToken).run(),
          };
        })
        .match((l) => throw l, (r) => r)
        .run();
  }
}

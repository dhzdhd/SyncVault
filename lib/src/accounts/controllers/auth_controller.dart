import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';
import 'package:syncvault/src/accounts/models/folder_info_model.dart';
import 'package:syncvault/src/accounts/services/auth_service.dart';
import 'package:syncvault/errors.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

enum AuthProviderType {
  oneDrive,
  dropBox,
  googleDrive,
}

@riverpod
class Auth extends _$Auth {
  @override
  List<AuthProviderModel> build() {
    return init();
  }

  static List<AuthProviderModel> init() {
    final List<dynamic> raw =
        jsonDecode(Hive.box('vault').get('accounts', defaultValue: '[]'));

    try {
      return raw.map((e) => AuthProviderModel.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  TaskEither<AppError, ()> signIn(AuthProviderType provider) {
    return switch (provider) {
      AuthProviderType.oneDrive => OneDriveAuth().signIn(),
      AuthProviderType.dropBox => DropBoxAuth().signIn(),
      AuthProviderType.googleDrive => GoogleDriveAuth().signIn(),
    }
        .map(
      (model) {
        state = [...state, model];
        Hive.box('vault').put(
          'accounts',
          jsonEncode(state.map((e) => e.toJson()).toList()),
        );

        return ();
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
        state = [...state.where((e) => e != model), r];
        return r;
      },
    );
  }

  void signOut(AuthProviderModel model) async {
    state = state.where((element) => element != model).toList();
    Hive.box('vault').put(
      'accounts',
      jsonEncode(state.map((e) => e.toJson()).toList()),
    );
  }

  Future<Either<AppError, FolderInfoModel>> getDriveInfo(
    AuthProviderModel model,
  ) async {
    // Improve with a TaskEither
    return await (await refresh(model).run()).bindFuture((a) async {
      return switch (a.provider) {
        AuthProviderType.oneDrive =>
          await OneDriveAuth().getDriveInfo(a.accessToken).run(),
        AuthProviderType.dropBox =>
          await DropBoxAuth().getDriveInfo(a.accessToken).run(),
        AuthProviderType.googleDrive =>
          await GoogleDriveAuth().getDriveInfo(a.accessToken).run(),
      };
    }).run();
  }
}

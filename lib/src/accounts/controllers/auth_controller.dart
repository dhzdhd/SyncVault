import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';
import 'package:syncvault/src/accounts/models/folder_info_model.dart';
import 'package:syncvault/src/accounts/services/auth_service.dart';
import 'package:syncvault/errors.dart';

enum AuthProviderType {
  oneDrive,
  dropBox,
}

final authProvider =
    StateNotifierProvider<AuthProviderNotifier, List<AuthProviderModel>>((ref) {
  return AuthProviderNotifier();
});

class AuthProviderNotifier extends StateNotifier<List<AuthProviderModel>> {
  AuthProviderNotifier() : super(init());

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

  TaskEither<AppError, ()> refresh(AuthProviderModel model) {
    // ! Return the model instead of unit
    return switch (model.provider) {
      AuthProviderType.oneDrive => OneDriveAuth().refresh(model),
      AuthProviderType.dropBox => DropBoxAuth().refresh(model),
    }
        .map(
      (r) {
        state = [...state.where((e) => e != model), r];
        return ();
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
    await refresh(model).run();
    final authModel =
        state.where((element) => element.email == model.email).first;

    return switch (authModel.provider) {
      AuthProviderType.oneDrive =>
        await OneDriveAuth().getDriveInfo(authModel.accessToken).run(),
      AuthProviderType.dropBox =>
        await DropBoxAuth().getDriveInfo(authModel.accessToken).run(),
    };
  }
}

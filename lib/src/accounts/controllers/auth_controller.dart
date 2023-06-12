import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';
import 'package:syncvault/src/accounts/models/folder_info_model.dart';
import 'package:syncvault/src/accounts/services/auth_service.dart';

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

  Future<Either<String, String>> signIn(AuthProviderType provider) async {
    final result = switch (provider) {
      AuthProviderType.oneDrive => await OneDriveAuth().signIn(),
      AuthProviderType.dropBox => await DropBoxAuth().signIn(),
    };

    return result.map((model) {
      print(model.toJson().toString());
      state = [...state, model];
      Hive.box('vault').put(
        'accounts',
        jsonEncode(state.map((e) => e.toJson()).toList()),
      );

      return 'Success';
    });
  }

  Future<void> refresh(AuthProviderModel model) async {
    final result = switch (model.provider) {
      AuthProviderType.oneDrive => await OneDriveAuth().refresh(model),
      AuthProviderType.dropBox => await DropBoxAuth().refresh(model),
    };

    // Use where
    var newState = state;
    newState.removeWhere((e) => e == model);
    state = [...newState, result];
  }

  void signOut(AuthProviderModel model) async {
    state = state.where((element) => element != model).toList();
    Hive.box('vault').put(
      'accounts',
      jsonEncode(state.map((e) => e.toJson()).toList()),
    );
  }

  Future<Either<String, FolderInfoModel>> getDriveInfo(
      AuthProviderModel authModel) async {
    await refresh(authModel);

    return switch (authModel.provider) {
      AuthProviderType.oneDrive =>
        await OneDriveAuth().getDriveInfo(authModel.accessToken).run(),
      AuthProviderType.dropBox =>
        await DropBoxAuth().getDriveInfo(authModel.accessToken).run(),
    };
  }
}

import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';
import 'package:syncvault/src/accounts/services/auth_service.dart';

enum AuthProvider {
  oneDrive,
  googleDrive,
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

  Future<void> signIn(AuthProvider provider) async {
    final result = switch (provider) {
      AuthProvider.oneDrive => await OneDriveAuth().signIn(),
      AuthProvider.googleDrive => await GoogleDriveAuth().signIn(),
    };
    print(result.toJson().toString());

    state = [...state, result];
    Hive.box('vault').put(
      'accounts',
      jsonEncode(state.map((e) => e.toJson()).toList()),
    );
  }

  Future<void> refresh(AuthProviderModel model) async {
    final result = switch (model.provider) {
      AuthProvider.oneDrive => await OneDriveAuth().refresh(model),
      AuthProvider.googleDrive => await GoogleDriveAuth().refresh(model),
    };

    var newState = state;
    newState.removeWhere((e) => e == model);
    state = [...newState, result];
  }

  Future<void> signOut(AuthProviderModel model) async {
    state = state.where((element) => element != model).toList();
  }
}

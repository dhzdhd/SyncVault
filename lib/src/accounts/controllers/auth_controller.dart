import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';
import 'package:syncvault/src/accounts/services/cloud_base.dart';

enum AuthProvider {
  oneDrive,
  googleDrive,
}

final authProvider =
    StateNotifierProvider<AuthProviderNotifier, List<AuthProviderModel>>((ref) {
  return AuthProviderNotifier();
});

class AuthProviderNotifier extends StateNotifier<List<AuthProviderModel>> {
  AuthProviderNotifier()
      : super(
          (jsonDecode(Hive.box('vault').get('accounts', defaultValue: []))
                  as List<dynamic>)
              .map((e) => AuthProviderModel.fromJson(e))
              .toList(),
        );

  Future<void> signIn(AuthProvider provider) async {
    final result = switch (provider) {
      AuthProvider.oneDrive => await OneDrive().signIn(),
      AuthProvider.googleDrive => await GoogleDrive().signIn(),
    };
    print(result.toJson().toString());

    state = [...state, result];
    Hive.box('vault').put(
      'accounts',
      jsonEncode(state.map((e) => e.toJson()).toList()),
    );
  }
}

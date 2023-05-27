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
  AuthProviderNotifier() : super([]);

  Future<void> signIn(AuthProvider provider) async {
    final result = switch (provider) {
      AuthProvider.oneDrive => await OneDrive().signIn(),
      AuthProvider.googleDrive => await GoogleDrive().signIn(),
    };
    print(result.toJson().toString());

    state = [...state, result];
  }
}

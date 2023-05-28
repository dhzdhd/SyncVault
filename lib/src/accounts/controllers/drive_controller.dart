import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';

final driveProvider =
    StateNotifierProvider<DriveNotifier, List<AuthProviderModel>>((ref) {
  return DriveNotifier();
});

class DriveNotifier extends StateNotifier<List<AuthProviderModel>> {
  DriveNotifier()
      : super(
          (jsonDecode(Hive.box('vault').get('accounts', defaultValue: []))
                  as List<dynamic>)
              .map((e) => AuthProviderModel.fromJson(e))
              .toList(),
        );

  Future<void> getDriveInfo(AuthProviderModel model) async {}
}

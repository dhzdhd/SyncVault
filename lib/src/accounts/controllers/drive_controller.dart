import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/models/drive_model.dart';

final driveProvider =
    StateNotifierProvider<DriveNotifier, List<DriveModel>>((ref) {
  return DriveNotifier();
});

class DriveNotifier extends StateNotifier<List<DriveModel>> {
  DriveNotifier()
      : super(
          (jsonDecode(Hive.box('vault').get('accounts', defaultValue: []))
                  as List<dynamic>)
              .map((e) => DriveModel.fromJson(e))
              .toList(),
        );

  Future<void> getFolderStatus(DriveModel model) async {}
}

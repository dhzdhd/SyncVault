import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';

final folderProvider =
    StateNotifierProvider<FolderNotifier, List<FolderModel>>((ref) {
  return FolderNotifier();
});

class FolderNotifier extends StateNotifier<List<FolderModel>> {
  FolderNotifier() : super(init());

  static List<FolderModel> init() {
    final List<dynamic> raw =
        jsonDecode(Hive.box('vault').get('folders', defaultValue: '[]'));

    try {
      return raw.map((e) => FolderModel.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> getFolderStatus(FolderModel model) async {}

  void append(AuthProviderModel model, String folderPath) {
    final folder = FolderModel(model: model, localPath: folderPath);
    state = [...state, folder];
  }
}

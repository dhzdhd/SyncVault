import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/accounts/services/drive_service.dart';

final folderProvider =
    StateNotifierProvider<FolderNotifier, List<FolderModel>>((ref) {
  return FolderNotifier(ref);
});

class FolderNotifier extends StateNotifier<List<FolderModel>> {
  FolderNotifier(this.ref) : super(init());

  late final StateNotifierProviderRef<FolderNotifier, List<FolderModel>> ref;

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

  Future<void> create(
      AuthProviderModel model, String folderPath, String folderName) async {
    final folderModel = FolderModel(
      model: model,
      folderPath: folderPath,
      folderName: folderName,
    );

    await ref.watch(authProvider.notifier).refresh(model);
    // Errors out because refreshed token is not updated in folderModel
    // Consider making a pointer & perhaps make authModel mutable
    final id = await OneDrive().createFolder(folderModel);
    print(id);

    state = [...state, folderModel];
    Hive.box('vault').put(
      'folders',
      jsonEncode(state.map((e) => e.toJson()).toList()),
    );
  }

  void delete(FolderModel model) {
    state = state.where((element) => element != model).toList();
    Hive.box('vault').put(
      'folders',
      jsonEncode(state.map((e) => e.toJson()).toList()),
    );
  }
}

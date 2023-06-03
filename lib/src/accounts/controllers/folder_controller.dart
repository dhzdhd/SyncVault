import 'dart:convert';

import 'package:fpdart/fpdart.dart';
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

  Future<Either<String, String>> create(
    AuthProviderModel authModel,
    String folderPath,
    String folderName,
  ) async {
    final folderModel = FolderModel(
      email: authModel.email,
      provider: authModel.provider,
      folderPath: folderPath,
      folderName: folderName,
    );

    await ref.watch(authProvider.notifier).refresh(authModel);
    final newAuthModel = ref
        .watch(authProvider)
        .where((element) => element.email == authModel.email)
        .first;

    // Perhaps make authModel mutable
    final id = await OneDrive().createFolder(folderModel, newAuthModel).run();
    return id.bind((r) {
      state = [...state, folderModel];
      Hive.box('vault').put(
        'folders',
        jsonEncode(state.map((e) => e.toJson()).toList()),
      );
      return Right(r);
    });
  }

  void delete(FolderModel model) {
    state = state.where((element) => element != model).toList();
    Hive.box('vault').put(
      'folders',
      jsonEncode(state.map((e) => e.toJson()).toList()),
    );
  }
}

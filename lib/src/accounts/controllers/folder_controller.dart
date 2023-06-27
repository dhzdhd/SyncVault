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

  void toggleAutoSync(FolderModel model) {
    final index = state.indexOf(model);
    state = [
      ...state
        ..remove(model)
        ..insert(
          index,
          model.copyWith(isAutoSync: !model.isAutoSync),
        )
    ];
    Hive.box('vault').put(
      'folders',
      jsonEncode(state.map((e) => e.toJson()).toList()),
    );
  }

  void toggleDeletionOnSync(FolderModel model) {
    final index = state.indexOf(model);
    state = [
      ...state
        ..remove(model)
        ..insert(
          index,
          model.copyWith(isDeletionEnabled: !model.isDeletionEnabled),
        )
    ];
    Hive.box('vault').put(
      'folders',
      jsonEncode(state.map((e) => e.toJson()).toList()),
    );
  }

  Future<Either<String, String>> create(
    AuthProviderModel authModel,
    String folderPath,
    String folderName,
  ) async {
    await ref.read(authProvider.notifier).refresh(authModel).run();
    final newAuthModel = ref
        .read(authProvider)
        .where((element) => element.email == authModel.email)
        .first;

    // Perhaps make authModel mutable
    final idResult = await OneDrive()
        .createFolder(
          folderName: some(folderName),
          accessToken: newAuthModel.accessToken,
          folderId: some(newAuthModel.folderId),
        )
        .run();
    return idResult.bind((id) {
      final folderModel = FolderModel(
        email: authModel.email,
        provider: authModel.provider,
        folderPath: folderPath,
        folderName: folderName,
        folderId: id,
        isAutoSync: true,
        isDeletionEnabled: false,
      );

      state = [...state, folderModel];
      Hive.box('vault').put(
        'folders',
        jsonEncode(state.map((e) => e.toJson()).toList()),
      );
      return right('Success');
    });
  }

  Future<Either<String, String>> upload(
    FolderModel folderModel,
    Option<String> filePath,
  ) async {
    // Improvise
    final oldAuthModel = ref
        .read(authProvider)
        .where((element) => element.email == folderModel.email)
        .first;

    await ref.read(authProvider.notifier).refresh(oldAuthModel).run();

    final authModel = ref
        .read(authProvider)
        .where((element) => element.email == folderModel.email)
        .first;

    return await OneDrive().upload(folderModel, authModel, filePath).run();
  }

  void delete(FolderModel model) {
    state = state.where((element) => element != model).toList();
    Hive.box('vault').put(
      'folders',
      jsonEncode(state.map((e) => e.toJson()).toList()),
    );
  }
}

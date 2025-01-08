import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/models/file_model.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';
import 'package:syncvault/src/home/services/rclone.dart';

part 'folder_controller.g.dart';

final _box = GetIt.I<Box<FolderModel>>();

@riverpod
class CreateFolderController extends _$CreateFolderController {
  @override
  FutureOr<void> build() {}

  Future<void> createFolder({
    required DriveProviderModel authModel,
    required String folderPath,
    required String folderName,
    String remoteParentPath =
        'SyncVault/', // TODO: Remove extra defaults in later calls
  }) async {
    final folderNotifier = ref.read(folderProvider.notifier);

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => folderNotifier.createFolder(
        authModel: authModel,
        folderName: folderName,
        folderPath: folderPath,
        remoteParentPath: remoteParentPath,
      ),
    );
  }
}

@riverpod
class UploadDeleteController extends _$UploadDeleteController {
  @override
  FutureOr<void> build() {}

  Future<void> upload(
    FolderModel folderModel,
    Option<String> filePath,
  ) async {
    final folderNotifier = ref.read(folderProvider.notifier);

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => folderNotifier.upload(
        folderModel,
        filePath,
      ),
    );
  }

  Future<void> delete(
    FolderModel folderModel,
    Option<String> filePath,
  ) async {
    final folderNotifier = ref.read(folderProvider.notifier);

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => folderNotifier.delete(
        folderModel,
        filePath,
      ),
    );
  }
}

@riverpod
Future<Option<FileModel>> treeView(Ref ref, FolderModel folderModel) async {
  return RCloneDriveService()
      .treeView(model: folderModel)
      .match((l) => throw l, (r) => r)
      .run();
}

@riverpod
class Folder extends _$Folder {
  @override
  List<FolderModel> build() {
    return init();
  }

  static List<FolderModel> init() {
    return _box.values.toList();
  }

  Future<void> toggleAutoSync(FolderModel model) async {
    final index = state.indexOf(model);
    state = [
      ...state
        ..remove(model)
        ..insert(
          index,
          model.copyWith(isAutoSync: !model.isAutoSync),
        )
    ];

    await _box.clear();
    await _box.addAll(state);
  }

  Future<void> toggleDeletionOnSync(FolderModel model) async {
    final index = state.indexOf(model);
    state = [
      ...state
        ..remove(model)
        ..insert(
          index,
          model.copyWith(isDeletionEnabled: !model.isDeletionEnabled),
        )
    ];

    await _box.clear();
    await _box.addAll(state);
  }

  Future<void> toggleTwoWaySync(FolderModel model) async {
    final index = state.indexOf(model);
    state = [
      ...state
        ..remove(model)
        ..insert(
          index,
          model.copyWith(isTwoWaySync: !model.isTwoWaySync),
        )
    ];

    await _box.clear();
    await _box.addAll(state);
  }

  Future<void> createFolder({
    required DriveProviderModel authModel,
    required String folderPath,
    required String folderName,
    String remoteParentPath = 'SyncVault/',
  }) async {
    final driveService = RCloneDriveService();

    final model = await driveService
        .create(
          folderName: folderName,
          folderPath: folderPath,
          remoteParentPath: remoteParentPath,
          model: authModel,
        )
        .match((l) => throw l, (r) => r)
        .run();

    state = [...state, model];

    await _box.clear();
    await _box.addAll(state);
  }

  Future<void> upload(
    FolderModel folderModel,
    Option<String> filePath,
  ) async {
    final providerModels = ref.watch(authProvider);
    final providerModel = providerModels
        .filter((t) => t.remoteName == folderModel.remoteName)
        .first;

    await RCloneDriveService()
        .upload(
          providerModel: providerModel,
          folderModel: folderModel,
          localPath: folderModel.folderPath,
        )
        .run();

    // TODO: Implement per file
  }

  Future<void> delete(FolderModel model, Option<String> path) async {
    // TODO: Implement per file
    final providerModels = ref.watch(authProvider);
    final providerModel =
        providerModels.filter((t) => t.remoteName == model.remoteName).first;

    await RCloneDriveService()
        .delete(providerModel: providerModel, folderModel: model)
        .run();

    state = state.where((element) => element != model).toList();

    await _box.clear();
    await _box.addAll(state);
  }

  Future<()> clearCache() async {
    state = [];
    await _box.clear();
    await _box.flush();

    return ();
  }
}

import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/helpers.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/models/file_model.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncvault/src/common/services/hive_storage.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';
import 'package:syncvault/src/home/models/folder_hash_model.dart';
import 'package:syncvault/src/home/services/file_comparer.dart';
import 'package:syncvault/src/home/services/providers/google_drive.dart';
import 'package:syncvault/src/home/services/rclone.dart';

part 'folder_controller.g.dart';

final _folderBox = GetIt.I<Box<FolderModel>>();
final _hashBox = GetIt.I<Box<FolderHashModel>>();
// TODO: Make fetchable from GetIt
final _folderStorage = HiveStorage<FolderModel>(_folderBox);

@riverpod
class CreateFolderController extends _$CreateFolderController {
  @override
  FutureOr<void> build() {}

  Future<void> createFolder({
    required DriveProviderModel authModel,
    required String folderPath,
    required String folderName,
    required Option<String> remoteParentPath,
  }) async {
    final folderNotifier = ref.read(folderProvider.notifier);

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => folderNotifier.create(
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

  Future<void> upload(FolderModel folderModel, Option<String> filePath) async {
    final folderNotifier = ref.read(folderProvider.notifier);

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => folderNotifier.upload(folderModel, filePath),
    );
  }

  Future<void> delete(FolderModel folderModel, bool deleteRemote) async {
    final folderNotifier = ref.read(folderProvider.notifier);

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => folderNotifier.delete(folderModel, deleteRemote),
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
  final _hashStorage = HiveStorage<FolderHashModel>(_hashBox);
  final _fileComparer = FileComparer();

  @override
  List<FolderModel> build() {
    return init();
  }

  static List<FolderModel> init() {
    return _folderStorage.fetchAll().toList();
  }

  Future<void> toggleAutoSync(FolderModel model) async {
    final index = state.indexOf(model);
    state = [
      ...state
        ..remove(model)
        ..insert(index, model.copyWith(isAutoSync: !model.isAutoSync)),
    ];

    _folderStorage.update(state);
  }

  Future<void> toggleDeletionOnSync(FolderModel model) async {
    final index = state.indexOf(model);
    state = [
      ...state
        ..remove(model)
        ..insert(
          index,
          model.copyWith(isDeletionEnabled: !model.isDeletionEnabled),
        ),
    ];

    _folderStorage.update(state);
  }

  Future<void> toggleTwoWaySync(FolderModel model) async {
    final index = state.indexOf(model);
    state = [
      ...state
        ..remove(model)
        ..insert(index, model.copyWith(isTwoWaySync: !model.isTwoWaySync)),
    ];

    _folderStorage.update(state);
  }

  Future<void> create({
    required DriveProviderModel authModel,
    required String folderPath,
    required String folderName,
    required Option<String> remoteParentPath,
  }) async {
    // TODO: Segregate by provider
    final driveService = authModel.isRCloneBackend
        ? RCloneDriveService()
        : GoogleDriveService();

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

    await _folderStorage.addSingle(model);
  }

  Future<void> upload(FolderModel folderModel, Option<String> filePath) async {
    final providerModels = ref.watch(authProvider);
    final providerModel = providerModels.requireValue
        .filter((t) => t.remoteName == folderModel.remoteName)
        .first;

    await RCloneDriveService()
        .upload(
          providerModel: providerModel,
          folderModel: folderModel,
          localPath: folderModel.folderPath,
        )
        .run();

    if (PlatformExtension.isMobile) {
      final files = await Directory(
        folderModel.folderPath,
      ).list(recursive: true).toList();
      final hashResult = await _fileComparer
          .calcHash(files.whereType<File>().toList())
          .run();
      hashResult.match(
        (err) =>
            GeneralError('Hashes do not match', err.message, err.stackTrace),
        (hash) {
          final hashModels = _hashStorage.fetchAll().toList();
          final model = FolderHashModel(
            hash: hash,
            remoteName: folderModel.remoteName,
          );
          _hashStorage.update(
            hashModels
              ..removeWhere((e) => e.remoteName == model.remoteName)
              ..add(model),
          );
        },
      );
    }

    // TODO: Implement per file
  }

  Future<void> delete(FolderModel model, bool deleteRemote) async {
    if (deleteRemote) {
      final providerModels = ref.watch(authProvider);
      final providerModel = providerModels.requireValue
          .filter((t) => t.remoteName == model.remoteName)
          .first;

      await RCloneDriveService()
          .delete(providerModel: providerModel, folderModel: model)
          .run();
    }

    state = state.where((element) => element != model).toList();
    await _folderStorage.update(state);
  }

  Future<void> clearCache() async {
    state = [];
    await _folderStorage.clear();
  }
}

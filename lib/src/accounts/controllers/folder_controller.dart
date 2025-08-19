import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:hashlib/random.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/models/file_model.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncvault/src/common/services/hive_storage.dart';
import 'package:syncvault/src/home/models/drive_provider.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';
import 'package:syncvault/src/home/services/providers/google_drive.dart';
import 'package:syncvault/src/home/services/rclone.dart';

part 'folder_controller.g.dart';

final _folderBox = GetIt.I<Box<FolderModel>>();
// TODO: Make fetchable from GetIt
final _folderStorage = HiveStorage<FolderModel>(_folderBox);

@riverpod
class CreateFolderController extends _$CreateFolderController {
  @override
  FutureOr<void> build() {}

  Future<void> createFolder({
    required String folderName,
    required Option<String> parentPath,
    required DriveProviderModel model,
  }) async {
    final folderNotifier = ref.read(folderProvider.notifier);

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async => await folderNotifier.create(
        folderName: folderName,
        parentPath: parentPath,
        providerModel: model,
      ),
    );
  }
}

@riverpod
class UploadDeleteController extends _$UploadDeleteController {
  @override
  FutureOr<void> build() {}

  Future<void> delete(FolderModel folderModel, bool deleteRemote) async {
    final folderNotifier = ref.read(folderProvider.notifier);

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => folderNotifier.delete(folderModel, deleteRemote),
    );
  }
}

@riverpod
Future<Option<FileModel>> treeView(Ref ref, RemoteProviderModel model) async {
  return RCloneDriveService()
      .treeView(model: model)
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
    return _folderStorage.fetchAll().toList();
  }

  Future<void> create({
    required String folderName,
    required Option<String> parentPath,
    required DriveProviderModel providerModel,
  }) async {
    final model = switch (providerModel) {
      LocalProviderModel() => LocalFolderModel(
        id: uuid.v4(),
        folderName: folderName,
        folderPath: parentPath.toNullable()!,
      ),
      RemoteProviderModel(:final isRCloneBackend, :final provider) =>
        await (isRCloneBackend
                ? RCloneDriveService()
                : switch (provider) {
                    GoogleDriveProvider() => GoogleDriveService(),
                    _ => throw UnimplementedError(),
                  })
            .create(
              folderName: folderName,
              model: providerModel,
              parentPath: parentPath,
            )
            .match((l) => throw l, (r) => r)
            .run(),
    };

    state = [...state, model];

    await _folderStorage.addSingle(model);
  }

  Future<void> delete(FolderModel model, bool deleteFolder) async {
    if (deleteFolder) {
      await switch (model) {
        LocalFolderModel(:final folderPath) => () async {
          await Directory(folderPath).delete();
        }(),
        RemoteFolderModel(:final remoteName) => () async {
          final providerModel = ref
              .read(authProvider)
              .requireValue
              .filter((t) => t.remoteName == remoteName)
              .firstOption;

          if (providerModel.isSome()) {
            await RCloneDriveService()
                .delete(
                  providerModel: providerModel.toNullable()!,
                  folderModel: model,
                )
                .run();
          }
        }(),
      };
    }

    state = state.where((element) => element != model).toList();
    await _folderStorage.update(state);
  }

  Future<void> clearCache() async {
    state = [];
    await _folderStorage.clear();
  }
}

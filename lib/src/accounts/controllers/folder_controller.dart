import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';
import 'package:syncvault/errors.dart';
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

  Future<void> createFolder(
    DriveProviderModel authModel,
    String parentPath,
    String folderName,
  ) async {
    final folderNotifier = ref.read(folderProvider.notifier);

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => folderNotifier.createFolder(
        authModel,
        parentPath,
        folderName,
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
    // TODO: Update
    await _box.add(model);
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

    // TODO: Update
    await _box.add(model);
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

    // TODO: Update
    await _box.add(model);
  }

  Future<void> createFolder(
    DriveProviderModel authModel,
    String parentPath,
    String folderName,
  ) async {
    final driveService = RCloneDriveService();

    final model = await driveService
        .create(
          folderName: folderName,
          parentPath: parentPath,
          model: authModel,
        )
        .match((l) => throw l, (r) => r)
        .run();

    // final files = await driveService
    //     .getAllItems(
    //       root: some(id),
    //       accessToken: newAuthModel.accessToken,
    //       filter: none(),
    //     )
    //     .match((l) => throw l, (r) => r)
    //     .run();

    state = [...state, model];
    await _box.add(model);
  }

  Future<void> upload(
    FolderModel folderModel,
    Option<String> filePath,
  ) async {
    // Improvise
    // final oldAuthModel = ref
    //     .watch(authProvider)
    //     .where(
    //       (element) =>
    //           element.email == folderModel.email &&
    //           element.provider == folderModel.provider,
    //     )
    //     .first;

    // final newAuthModel =
    //     (await ref.read(authProvider.notifier).refresh(oldAuthModel).run())
    //         .match((l) => throw l, (r) => r);

    // final result = await switch (newAuthModel.provider) {
    //   AuthProviderType.oneDrive => OneDrive(),
    //   AuthProviderType.dropBox => DropBox(),
    //   AuthProviderType.googleDrive => GoogleDrive()
    // }
    //     .upload(folderModel, newAuthModel, filePath)
    //     .run();

    // final driveService = switch (newAuthModel.provider) {
    //   AuthProviderType.oneDrive => OneDrive(),
    //   AuthProviderType.dropBox => DropBox(),
    //   AuthProviderType.googleDrive => GoogleDrive()
    // };

    // // TODO: Implement for particular folder
    // final files = await driveService
    //     .getAllItems(
    //       root: none(),
    //       accessToken: newAuthModel.accessToken,
    //       filter: none(),
    //     )
    //     .match((l) => throw l, (r) => r)
    //     .run();

    // state = [
    //   ...state
    //     ..remove(folderModel)
    //     ..add(folderModel.copyWith(files: files))
    // ];
    // Hive.box('vault').put(
    //   hiveFoldersKey,
    //   jsonEncode(state.map((e) => e.toJson()).toList()),
    // );

    // print(result);
    // if (result.isLeft()) {
    //   throw result.getLeft().toNullable()!;
    // }
  }

  // TaskEither<AppError, ()> delete(FolderModel model, Option<String> path) {
  //   final oldAuthModel = ref
  //       .watch(authProvider)
  //       .where(
  //         (element) =>
  //             element.email == model.email &&
  //             element.provider == model.provider,
  //       )
  //       .first;

  //   return TaskEither.tryCatch(() async {
  //     final result = await ref
  //         .read(authProvider.notifier)
  //         .refresh(oldAuthModel)
  //         .flatMap(
  //           (r) => switch (model.provider) {
  //             AuthProviderType.oneDrive => OneDrive(),
  //             AuthProviderType.dropBox => DropBox(),
  //             AuthProviderType.googleDrive => GoogleDrive()
  //           }
  //               .delete(folderModel: model, authModel: r, path: path),
  //         )
  //         .run();

  //     return result.match((l) => throw l, (r) {
  //       if (path.isNone()) {
  //         state = state.where((element) => element != model).toList();
  //         Hive.box('vault').put(
  //           hiveFoldersKey,
  //           jsonEncode(state.map((e) => e.toJson()).toList()),
  //         );
  //       }

  //       return ();
  //     });
  //   }, (error, stackTrace) => error.segregateError());
  // }

  TaskEither<AppError, ()> clearCache() {
    return TaskEither.tryCatch(() async {
      state = [];
      await _box.clear();

      return ();
    }, (error, stackTrace) => error.segregateError());
  }
}

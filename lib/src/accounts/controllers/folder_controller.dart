import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/errors.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncvault/src/accounts/services/drive/dropbox.dart';
import 'package:syncvault/src/accounts/services/drive/gdrive.dart';
import 'package:syncvault/src/accounts/services/drive/onedrive.dart';

part 'folder_controller.g.dart';

@riverpod
class Folder extends _$Folder {
  @override
  List<FolderModel> build() {
    return init();
  }

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

  TaskEither<AppError, ()> createFolder(
    AuthProviderModel authModel,
    String folderPath,
    String folderName,
  ) {
    return TaskEither.tryCatch(() async {
      final response =
          await ref.read(authProvider.notifier).refresh(authModel).run();
      final newAuthModel = response.match((l) => throw l, (r) => r);

      final driveService = switch (newAuthModel.provider) {
        AuthProviderType.oneDrive => OneDrive(),
        AuthProviderType.dropBox => DropBox(),
        AuthProviderType.googleDrive => GoogleDrive()
      };

      // TODO: Check if SyncVault already exists and use it
      final files = await driveService
          .getAllItems(
            root: '',
            accessToken: newAuthModel.accessToken,
            filter: none(),
          )
          .run();

      final idResult = await driveService
          .createFolder(
            folderName: some(folderName),
            accessToken: newAuthModel.accessToken,
            parentId: some(newAuthModel.folderId),
          )
          .run();

      return idResult
          .bindFuture((id) async {
            final folderModel = FolderModel(
              email: newAuthModel.email,
              provider: newAuthModel.provider,
              folderPath: folderPath,
              folderName: folderName,
              folderId: id,
              isAutoSync: true,
              isDeletionEnabled: false,
              files: [],
            );

            state = [...state, folderModel];
            Hive.box('vault').put(
              'folders',
              jsonEncode(state.map((e) => e.toJson()).toList()),
            );
            return right('Success');
          })
          .match((l) => throw l, (r) => ())
          .run();
    }, (error, stackTrace) => error.segregateError());
  }

  TaskEither<AppError, ()> upload(
    FolderModel folderModel,
    Option<String> filePath,
  ) {
    // Improvise
    final oldAuthModel = ref
        .read(authProvider)
        .where(
          (element) =>
              element.email == folderModel.email &&
              element.provider == folderModel.provider,
        )
        .first;

    return TaskEither.tryCatch(
      () async {
        // final authModel = ref
        //     .read(authProvider)
        //     .where((element) => element.email == folderModel.email)
        //     .first;

        final response = await ref
            .read(authProvider.notifier)
            .refresh(oldAuthModel)
            .flatMap(
              (r) => switch (r.provider) {
                AuthProviderType.oneDrive => OneDrive(),
                AuthProviderType.dropBox => DropBox(),
                AuthProviderType.googleDrive => GoogleDrive()
              }
                  .upload(folderModel, r, filePath),
            )
            .run();

        return response.match((l) => throw l, (r) => ());
      },
      (error, stackTrace) => error.segregateError(),
    );
  }

  TaskEither<AppError, ()> delete(FolderModel model, Option<String> path) {
    final oldAuthModel = ref
        .read(authProvider)
        .where(
          (element) =>
              element.email == model.email &&
              element.provider == model.provider,
        )
        .first;

    return TaskEither.tryCatch(() async {
      final result = await ref
          .read(authProvider.notifier)
          .refresh(oldAuthModel)
          .flatMap(
            (r) => switch (model.provider) {
              AuthProviderType.oneDrive => OneDrive(),
              AuthProviderType.dropBox => DropBox(),
              AuthProviderType.googleDrive => GoogleDrive()
            }
                .delete(folderModel: model, authModel: r, path: path),
          )
          .run();

      return result.match((l) => throw l, (r) {
        if (path.isNone()) {
          state = state.where((element) => element != model).toList();
          Hive.box('vault').put(
            'folders',
            jsonEncode(state.map((e) => e.toJson()).toList()),
          );
        }

        return ();
      });
    }, (error, stackTrace) => error.segregateError());
  }
}

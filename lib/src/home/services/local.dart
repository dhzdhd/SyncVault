import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:hashlib/random.dart';
import 'package:injectable/injectable.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/accounts/models/file_model.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';
import 'package:syncvault/src/home/services/common.dart';

@singleton
class LocalDriveService implements DriveService {
  @override
  TaskEither<AppError, RemoteFolderModel> create({
    required String folderName,
    required RemoteProviderModel model,
    required Option<String> parentPath,
  }) {
    return TaskEither<AppError, RemoteFolderModel>.Do(($) async {
      await $(
        TaskEither.tryCatch(
          () async {
            await Directory(parentPath.toNullable()!).create(recursive: true);

            return ();
          },
          (err, stackTrace) => ProviderError(
            model.provider,
            ProviderOperationType.remoteCreation,
            err,
            stackTrace,
          ).logError(),
        ),
      );

      final _ = LocalFolderModel(
        id: uuid.v4(),
        folderName: folderName,
        folderPath: parentPath.toNullable()!,
      );
      // return folderModel;

      // TODO: Support LocalFolderModel
      throw UnimplementedError();
    });
  }

  @override
  TaskEither<AppError, ()> delete({
    required RemoteProviderModel providerModel,
    required RemoteFolderModel folderModel,
  }) {
    return TaskEither<AppError, ()>.Do(($) async {
      final res = await $(
        TaskEither.tryCatch(
          () async {
            // TODO: Support LocalFolderModel
            await Directory('parentPath').delete();

            return ();
          },
          (err, stackTrace) => ProviderError(
            providerModel.provider,
            ProviderOperationType.delete,
            err,
            stackTrace,
          ).logError(),
        ),
      );

      return res;
    });
  }

  @override
  TaskEither<AppError, Option<FileModel>> treeView({
    required DriveProviderModel providerModel,
    required FolderModel folderModel,
  }) {
    return TaskEither<AppError, Option<FileModel>>.Do(($) async {
      final Option<FileModel> fileModel = await $(
        TaskEither.tryCatch(
          () async {
            final rootDir = Directory(
              (folderModel as LocalFolderModel).folderPath,
            );

            if (!await rootDir.exists()) {
              return none<FileModel>();
            }

            Future<FileModel> buildFileTree(FileSystemEntity entity) async {
              final stat = await entity.stat();
              final isDirectory = entity is Directory;

              List<FileModel> children = [];

              if (isDirectory) {
                final contents = await entity.list().toList();
                children = await Future.wait(
                  contents.map((child) => buildFileTree(child)),
                );
              }

              return FileModel(
                name: entity.path.split('/').last,
                size: stat.size.toString(),
                file: entity,
                parent: entity.parent,
                children: children,
              );
            }

            final rootTree = await buildFileTree(rootDir);
            return some(rootTree);
          },
          (err, stackTrace) {
            return AppError.general('message', err, stackTrace);
          },
        ),
      );
      return fileModel;
    });
  }
}

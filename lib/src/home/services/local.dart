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
  TaskEither<AppError, LocalFolderModel> create({
    required String folderName,
    required DriveProviderModel model,
    required Option<String> parentPath,
  }) {
    return TaskEither<AppError, LocalFolderModel>.Do(($) async {
      final path = await $(
        TaskEither.tryCatch(() async {
          final path = parentPath.toNullable()!;
          await Directory(path).create(recursive: true);

          return path;
        }, (err, stackTrace) => GeneralError('', err, stackTrace).logError()),
      );

      final folderModel = LocalFolderModel(
        id: uuid.v4(),
        folderName: folderName,
        folderPath: path,
      );
      return folderModel;
    });
  }

  @override
  TaskEither<AppError, ()> delete({
    required DriveProviderModel providerModel,
    required FolderModel folderModel,
  }) {
    return TaskEither<AppError, ()>.Do(($) async {
      final res = await $(
        TaskEither.tryCatch(() async {
          if (folderModel is LocalFolderModel) {
            await Directory('parentPath').delete();
          }

          return ();
        }, (err, stackTrace) => GeneralError('', err, stackTrace).logError()),
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

import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:hashlib/random.dart';
import 'package:injectable/injectable.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/log.dart';
import 'package:syncvault/src/accounts/models/file_model.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/home/models/connection_model.dart';
import 'package:syncvault/src/common/services/rclone.dart';
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
    final utils = RCloneUtils();

    return TaskEither<AppError, RemoteFolderModel>.Do(($) async {
      final execPath = await $(utils.getRCloneExec());
      final configArgs = await $(utils.getConfigArgs());

      await $(
        TaskEither.tryCatch(
          () async {
            final parentPathStr = parentPath.match(() => '/', (t) => '/$t/');

            // S3 only allows bucket name, not path
            final process = await Process.run(execPath, [
              ...configArgs,
              'mkdir',
              '${model.remoteName}:$parentPathStr$folderName',
            ]);

            if (process.stderr.toString().trim().isNotEmpty) {
              debugLogger.e(process.stderr);
            }

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

      final folderModel = RemoteFolderModel(
        id: uuid.v4(),
        folderName: folderName,
        remoteName: model.remoteName,
        parentPath: parentPath.toNullable(),
        folderId: null,
      );
      return folderModel;
    });
  }

  @override
  TaskEither<AppError, ()> upload({
    required RemoteProviderModel providerModel,
    required ConnectionModel connectionModel,
    required String localPath,
    String? rCloneExecPath,
  }) {
    final utils = RCloneUtils();

    return TaskEither<AppError, ()>.Do(($) async {
      final execPath = rCloneExecPath ?? await $(utils.getRCloneExec());
      final configArgs = await $(utils.getConfigArgs());

      final res = await $(
        TaskEither.tryCatch(
          () async {
            final parentPath = Option.fromNullable(
              connectionModel.title,
            ).match(() => '/', (t) => '/$t/');

            final process = await Process.run(execPath!, [
              // Use a 2 way copy to avoid deletion
              ...configArgs,
              connectionModel.direction == SyncDirection.bidirectional
                  ? 'bisync'
                  : 'sync',
              '-u', // Do not delete/update on remote if remote file is newer
              '-M',
              '--inplace', // Bisync fails without this
              if (connectionModel.direction == SyncDirection.bidirectional)
                '--resync',
              localPath,
              '${connectionModel.firstFolderId}:/$parentPath${connectionModel.firstFolderId}',
            ]);

            if (process.stderr.toString().trim().isNotEmpty) {
              debugLogger.e(process.stderr.toString());
            }

            return ();
          },
          (err, stackTrace) => ProviderError(
            providerModel.provider,
            ProviderOperationType.upload,
            err,
            stackTrace,
          ).logError(),
        ),
      );

      return res;
    });
  }

  @override
  TaskEither<AppError, ()> delete({
    required RemoteProviderModel providerModel,
    required RemoteFolderModel folderModel,
  }) {
    final utils = RCloneUtils();

    return TaskEither<AppError, ()>.Do(($) async {
      final execPath = await $(utils.getRCloneExec());
      final configArgs = await $(utils.getConfigArgs());

      final res = await $(
        TaskEither.tryCatch(
          () async {
            final parentPath = Option.fromNullable(
              folderModel.folderName,
            ).match(() => '/', (t) => '/$t/');

            final process = await Process.run(execPath, [
              ...configArgs,
              'purge',
              '${folderModel.remoteName}:/$parentPath${folderModel.folderName}',
            ]);

            if (process.stderr.toString().trim().isNotEmpty) {
              debugLogger.e(process.stderr.toString());
            }

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
            // return ProviderError(
            //   model.provider,
            //   ProviderOperationType.getTreeView,
            //   err,
            //   stackTrace,
            // ).logError();
          },
        ),
      );
      return fileModel;
    });
  }
}

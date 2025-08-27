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
class RCloneDriveService implements DriveService {
  @override
  TaskEither<AppError, FolderModel> create({
    required String folderName,
    required DriveProviderModel model,
    required Option<String> parentPath,
  }) {
    final utils = RCloneUtils();

    return TaskEither<AppError, RemoteFolderModel>.Do(($) async {
      final execPath = await $(utils.getRCloneExec());
      final configArgs = await $(utils.getConfigArgs());

      final remoteName = await $(
        TaskEither.tryCatch(() async {
          final parentPathStr = parentPath.match(() => '/', (t) => '/$t/');

          // S3 only allows bucket name, not path
          final process = await Process.run(execPath, [
            ...configArgs,
            'mkdir',
            '${(model as RemoteProviderModel).remoteName}:$parentPathStr$folderName',
          ]);

          if (process.stderr.toString().trim().isNotEmpty) {
            debugLogger.e(process.stderr);
          }

          return model.remoteName;
        }, (err, stackTrace) => GeneralError('', err, stackTrace).logError()),
      );

      final folderModel = RemoteFolderModel(
        id: uuid.v4(),
        folderName: folderName,
        remoteName: remoteName,
        parentPath: parentPath.toNullable(),
        folderId: null,
      );
      return folderModel;
    });
  }

  @override
  TaskEither<AppError, ()> delete({
    required DriveProviderModel providerModel,
    required FolderModel folderModel,
  }) {
    final utils = RCloneUtils();

    return TaskEither<AppError, ()>.Do(($) async {
      final execPath = await $(utils.getRCloneExec());
      final configArgs = await $(utils.getConfigArgs());

      final res = await $(
        TaskEither.tryCatch(() async {
          final parentPath = Option.fromNullable(
            folderModel.folderName,
          ).match(() => '/', (t) => '/$t/');

          final process = await Process.run(execPath, [
            ...configArgs,
            'purge',
            '${(folderModel as RemoteFolderModel).remoteName}:/$parentPath${folderModel.folderName}',
          ]);

          if (process.stderr.toString().trim().isNotEmpty) {
            debugLogger.e(process.stderr.toString());
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
    final utils = RCloneUtils();

    return TaskEither<AppError, Option<FileModel>>.Do(($) async {
      final execPath = await $(utils.getRCloneExec());
      final configArgs = await $(utils.getConfigArgs());

      final Option<FileModel> fileModel = await $(
        TaskEither.tryCatch(
          () async {
            // TODO: Get from parentPath
            // final parentPath = Option.fromNullable(
            //   model.remoteName,
            // ).match(() => '/', (t) => '/$t/');

            final (remoteName, parentPath, folderName) = switch (folderModel) {
              RemoteFolderModel(
                :final folderName,
                :final parentPath,
                :final remoteName,
              ) =>
                (
                  remoteName,
                  parentPath == null ? '/' : '/$parentPath/',
                  folderName,
                ),
              _ => throw GeneralError(
                'Only remote folders allowed',
                null,
                null,
              ),
            };
            final process = await Process.run(execPath, [
              ...configArgs,
              'tree',
              '-a',
              '--dirsfirst',
              '--full-path',
              '-s',
              '-Q',
              '$remoteName:$parentPath$folderName',
            ]);

            if (process.stderr.toString().trim().isNotEmpty) {
              debugLogger.e(process.stderr.toString());
            }

            final List<List<String>> matches = [];
            final output = process.stdout.toString();
            final lines = output.split('\n');

            // String is of the pattern - <garbage value> [     123]  "<path>"
            final regex = RegExp(
              r'\[\s*(\d+)\s*\]\s*\"([^\"]+)\"',
              dotAll: true,
            );
            for (final line in lines) {
              final matched = regex
                  .allMatches(line)
                  .toList()
                  .map((t) => t.groups([1, 2]))
                  .firstOrNull;
              if (matched != [] && matched != null) {
                matches.add([matched[0]!, matched[1]!.replaceAll('\\', '/')]);
              }
            }

            final done = [];
            FileModel buildFileTree(
              List<List<String>> paths,
              String currentPath,
              String currentSize,
              Option<Directory> parent,
            ) {
              // Get the name of the current path
              final currentSegments = currentPath
                  .split('/')
                  .where((seg) => seg.isNotEmpty)
                  .toList();
              final currentName = currentSegments.isEmpty
                  ? '/'
                  : currentSegments.last;

              // Find direct children of the current path
              final childrenPaths = paths.where((path) {
                final segments = path[1]
                    .split('/')
                    .where((seg) => seg.isNotEmpty)
                    .toList();
                return segments.length > currentSegments.length &&
                    List.generate(
                          currentSegments.length,
                          (i) => segments[i],
                        ).join('/') ==
                        currentSegments.join('/');
              }).toList();

              // Create child nodes recursively
              final List<FileModel> children = [];
              for (final childPath in childrenPaths) {
                final segments = childPath[1]
                    .split('/')
                    .where((seg) => seg.isNotEmpty)
                    .toList();
                final size = childPath[0];
                final childFullPath = segments.join('/');

                if (!done.contains(childFullPath)) {
                  done.add(childFullPath);
                  children.add(
                    buildFileTree(
                      paths,
                      childFullPath,
                      size,
                      some(Directory(currentPath)),
                    ),
                  );
                }
              }

              // Determine if the current node is a file or directory
              final isFile = !paths.any((path) {
                final segments = path[1]
                    .split('/')
                    .where((seg) => seg.isNotEmpty)
                    .toList();
                return segments.length > currentSegments.length &&
                    List.generate(
                          currentSegments.length,
                          (i) => segments[i],
                        ).join('/') ==
                        currentSegments.join('/');
              });

              final fileEntity = isFile
                  ? File(currentPath)
                  : Directory(currentPath);

              return FileModel(
                name: currentName,
                size: currentSize,
                file: fileEntity,
                parent: parent.toNullable() ?? Directory(''),
                children: children,
              );
            }

            if (matches.isNotEmpty) {
              final model = buildFileTree(matches, '/', '0', none());
              return some(model);
            }

            return none();
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

@singleton
class RCloneSyncService implements SyncService {
  @override
  TaskEither<AppError, ()> sync_({
    required ConnectionModel connectionModel,
    required FolderModel firstFolder,
    required DriveProviderModel firstProvider,
    required FolderModel secondFolder,
    required DriveProviderModel secondProvider,
  }) {
    final utils = RCloneUtils();

    return TaskEither<AppError, ()>.Do(($) async {
      final execPath = await $(utils.getRCloneExec());
      final configArgs = await $(utils.getConfigArgs());

      final firstPath = switch (firstFolder) {
        LocalFolderModel(:final folderPath) => folderPath,
        RemoteFolderModel(
          :final remoteName,
          :final folderName,
          :final parentPath,
        ) =>
          '$remoteName:/${Option.fromNullable(parentPath).match(() => '/', (t) => '/$t/')}$folderName',
      };
      final secondPath = switch (secondFolder) {
        LocalFolderModel(:final folderPath) => folderPath,
        RemoteFolderModel(
          :final remoteName,
          :final folderName,
          :final parentPath,
        ) =>
          '$remoteName:/${Option.fromNullable(parentPath).match(() => '/', (t) => '/$t/')}$folderName',
      };

      final res = await $(
        TaskEither.tryCatch(() async {
          final process = await Process.run(execPath, [
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
            firstPath,
            secondPath,
          ]);

          if (process.stderr.toString().trim().isNotEmpty) {
            debugLogger.e(process.stderr.toString());
          }

          return ();
        }, (err, stackTrace) => GeneralError('', err, stackTrace).logError()),
      );

      return res;
    });
  }
}

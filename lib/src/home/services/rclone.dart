import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/log.dart';
import 'package:syncvault/src/accounts/models/file_model.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/common/services/rclone.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';
import 'package:syncvault/src/home/services/common.dart';

@singleton
class RCloneDriveService implements DriveService {
  @override
  TaskEither<AppError, FolderModel> create({
    required String title,
    required DriveProviderModel model,
  }) {
    final utils = RCloneUtils();

    return TaskEither<AppError, FolderModel>.Do(($) async {
      final execPath = await $(utils.getRCloneExec());
      final configArgs = await $(utils.getConfigArgs());

      await $(
        TaskEither.tryCatch(
          () async {
            // TODO: Add parent path to backend
            // final parentPath = remoteParentPath.match(() => '/', (t) => '/$t/');
            final parentPath = '/';

            // TODO: S3 only allows bucket name, not path
            final process = await Process.run(execPath, [
              ...configArgs,
              'mkdir',
              '${model.remoteName}:$parentPath${model.folderName}',
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

      final folderModel = FolderModel(
        title: model.remoteName,
        firstRemote: model.remoteName,
        secondRemote: model.remoteName,
        isAutoSync: false,
        isDeletionEnabled: false,
        isTwoWaySync: false,
        folderId: null,
      );
      return folderModel;
    });
  }

  @override
  TaskEither<AppError, ()> upload({
    required DriveProviderModel providerModel,
    required FolderModel folderModel,
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
              folderModel.title,
            ).match(() => '/', (t) => '/$t/');

            final process = await Process.run(execPath!, [
              // Use a 2 way copy to avoid deletion
              ...configArgs,
              folderModel.isTwoWaySync ? 'bisync' : 'sync',
              '-u', // Do not delete/update on remote if remote file is newer
              '-M',
              '--inplace', // Bisync fails without this
              if (folderModel.isTwoWaySync) '--resync',
              localPath,
              '${folderModel.firstRemote}:/$parentPath${folderModel.firstRemote}',
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
    required DriveProviderModel providerModel,
    required FolderModel folderModel,
  }) {
    final utils = RCloneUtils();

    return TaskEither<AppError, ()>.Do(($) async {
      final execPath = await $(utils.getRCloneExec());
      final configArgs = await $(utils.getConfigArgs());

      final res = await $(
        TaskEither.tryCatch(
          () async {
            final parentPath = Option.fromNullable(
              folderModel.title,
            ).match(() => '/', (t) => '/$t/');

            final process = await Process.run(execPath, [
              ...configArgs,
              'purge',
              '${folderModel.firstRemote}:/$parentPath${folderModel.firstRemote}',
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
    required FolderModel model,
  }) {
    final utils = RCloneUtils();

    return TaskEither<AppError, Option<FileModel>>.Do(($) async {
      final execPath = await $(utils.getRCloneExec());
      final configArgs = await $(utils.getConfigArgs());

      final Option<FileModel> fileModel = await $(
        TaskEither.tryCatch(
          () async {
            final parentPath = Option.fromNullable(
              model.title,
            ).match(() => '/', (t) => '/$t/');

            final process = await Process.run(execPath, [
              ...configArgs,
              'tree',
              '-a',
              '--dirsfirst',
              '--full-path',
              '-s',
              '-Q',
              '${model.firstRemote}:/$parentPath${model.firstRemote}',
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

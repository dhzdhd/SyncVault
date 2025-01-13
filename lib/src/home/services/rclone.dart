import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/log.dart';
import 'package:syncvault/src/accounts/models/file_model.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/common/services/rclone.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';

@singleton
class RCloneDriveService {
  TaskEither<AppError, FolderModel> create({
    required DriveProviderModel model,
    required String folderPath,
    required String folderName,
    String remoteParentPath = 'SyncVault/',
  }) {
    final utils = RCloneUtils();

    return TaskEither<AppError, FolderModel>.Do(($) async {
      final execPath = await $(utils.getRCloneExec());
      final configArgs = await $(utils.getConfigArgs());

      await $(
        TaskEither.tryCatch(
          () async {
            // TODO: S3 only allows bucket name, not path
            final process = await Process.run(execPath, [
              ...configArgs,
              'mkdir',
              '${model.remoteName}:/$remoteParentPath$folderName'
            ]);

            if (process.stderr.toString().trim().isNotEmpty) {
              debugLogger.e(process.stderr);
            }

            return ();
          },
          (err, stackTrace) => err.handleError(
            'Failed to create directory in remote',
            stackTrace,
          ),
        ),
      );

      final folderModel = FolderModel(
        remoteName: model.remoteName,
        provider: model.provider,
        folderPath: folderPath,
        folderName: folderName,
        remoteParentPath: remoteParentPath,
        isAutoSync: false,
        isDeletionEnabled: false,
        isTwoWaySync: false,
        isRCloneBackend: true,
      );
      return folderModel;
    });
  }

  TaskEither<AppError, ()> upload({
    required DriveProviderModel providerModel,
    required FolderModel folderModel,
    required String localPath,
  }) {
    final utils = RCloneUtils();

    return TaskEither<AppError, ()>.Do(($) async {
      final execPath = await $(utils.getRCloneExec());
      final configArgs = await $(utils.getConfigArgs());

      final res = await $(
        TaskEither.tryCatch(
          () async {
            final process = await Process.run(execPath, [
              ...configArgs,
              'sync',
              localPath,
              '${folderModel.remoteName}:/${folderModel.remoteParentPath}${folderModel.folderName}'
            ]);

            if (process.stderr.toString().trim().isNotEmpty) {
              debugLogger.e(process.stderr.toString());
            }

            return ();
          },
          (err, stackTrace) =>
              err.handleError('Failed to upload files', stackTrace),
        ),
      );

      return res;
    });
  }

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
            final process = await Process.run(execPath, [
              ...configArgs,
              'purge',
              '${folderModel.remoteName}:/${folderModel.remoteParentPath}${folderModel.folderName}'
            ]);

            if (process.stderr.toString().trim().isNotEmpty) {
              debugLogger.e(process.stderr.toString());
            }

            return ();
          },
          (err, stackTrace) =>
              err.handleError('Failed to delete remote', stackTrace),
        ),
      );

      return res;
    });
  }

  TaskEither<AppError, Option<FileModel>> treeView({
    required FolderModel model,
  }) {
    final utils = RCloneUtils();

    return TaskEither<AppError, Option<FileModel>>.Do(($) async {
      final execPath = await $(utils.getRCloneExec());
      final configArgs = await $(utils.getConfigArgs());

      final Option<FileModel> fileModel = await $(TaskEither.tryCatch(
        () async {
          final process = await Process.run(execPath, [
            ...configArgs,
            'tree',
            '-a',
            '--dirsfirst',
            '--full-path',
            '-s',
            '-Q',
            '${model.remoteName}:/${model.remoteParentPath}${model.folderName}'
          ]);

          if (process.stderr.toString().trim().isNotEmpty) {
            debugLogger.e(process.stderr.toString());
          }

          final List<List<String>> matches = [];
          final output = process.stdout.toString();
          final lines = output.split('\n');

          // String is of the pattern - <garbage value> [     123]  "<path>"
          final regex = RegExp(r'\[\s*(\d+)\s*\]\s*\"([^\"]+)\"', dotAll: true);
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
            final currentSegments =
                currentPath.split('/').where((seg) => seg.isNotEmpty).toList();
            final currentName =
                currentSegments.isEmpty ? '/' : currentSegments.last;

            // Find direct children of the current path
            final childrenPaths = paths.where((path) {
              final segments =
                  path[1].split('/').where((seg) => seg.isNotEmpty).toList();
              return segments.length > currentSegments.length &&
                  List.generate(currentSegments.length, (i) => segments[i])
                          .join('/') ==
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
                children.add(buildFileTree(
                    paths, childFullPath, size, some(Directory(currentPath))));
              }
            }

            // Determine if the current node is a file or directory
            final isFile = !paths.any((path) {
              final segments =
                  path[1].split('/').where((seg) => seg.isNotEmpty).toList();
              return segments.length > currentSegments.length &&
                  List.generate(currentSegments.length, (i) => segments[i])
                          .join('/') ==
                      currentSegments.join('/');
            });

            final fileEntity =
                isFile ? File(currentPath) : Directory(currentPath);

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
        (err, stackTrace) =>
            err.handleError('Failed to get file tree', stackTrace),
      ));
      return fileModel;
    });
  }
}

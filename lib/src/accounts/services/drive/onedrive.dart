import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';
import 'package:syncvault/src/accounts/models/cloud_file_model.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/accounts/services/drive_service.dart';
import 'package:syncvault/src/accounts/models/filter.dart';

final _dio = GetIt.I<Dio>();

@singleton
class OneDrive implements DriveService {
  static const apiHost = 'graph.microsoft.com';
  static const basePath = '/beta/me/drive';

  @override
  TaskEither<AppError, String> createFolder({
    required Option<String> folderName,
    required String accessToken,
    required Option<String> parentId,
  }) {
    // Default parent is root directory
    final subPath = parentId.match(() => 'root', (t) => 'items/$t');

    final uri = Uri.https(apiHost, '$basePath/$subPath/children');
    final authOptions = Options(headers: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json'
    });

    return TaskEither.tryCatch(
      () async {
        final response = await _dio.postUri<Map<String, dynamic>>(
          uri,
          options: authOptions,
          data: {
            // Default created folder = SyncVault (usually only on account creation)
            // TODO: Move "SyncVault" to a globally accessible constant
            'name': folderName.match(() => 'SyncVault', (t) => t),
            'folder': {'childCount': 0}
          },
        );
        return response.data!['id'];
      },
      (error, stackTrace) {
        return error.segregateError();
      },
    );
  }

  @override
  TaskEither<AppError, ()> upload(
    FolderModel folderModel,
    AuthProviderModel authModel,
    Option<String> filePath,
  ) {
    final authOptions = Options(headers: {
      'Authorization': 'Bearer ${authModel.accessToken}',
      'Content-Type': 'application/json'
    });

    final folder = Directory(folderModel.folderPath);
    // Default path is all the files in the given root folder
    final files = filePath.match(
      () => folder.listSync(recursive: true, followLinks: false),
      (t) => [File(t)],
    );

    debugPrint(files.toString());

    final Map<String, String> idMap = {folder.path: folderModel.folderId};

    return TaskEither.tryCatch(
      () async {
        for (final file in files) {
          if (file is File) {
            final fileName = file.uri.pathSegments.last;
            final parentFolderDir = file.parent;

            var tempAncestorDir = parentFolderDir;
            List<Directory> ancestorDirList = [];
            while (tempAncestorDir.path != folder.path) {
              ancestorDirList.add(tempAncestorDir);
              tempAncestorDir = tempAncestorDir.parent;
            }

            for (final i in ancestorDirList.reversed) {
              if (!idMap.containsKey(i.path)) {
                final result = await createFolder(
                  folderName: some(
                    i.uri.pathSegments.elementAt(i.uri.pathSegments.length - 2),
                  ),
                  accessToken: authModel.accessToken,
                  parentId: some(idMap[i.parent.path]!),
                ).run();

                result.match(
                  (l) => throw l,
                  (r) => idMap[i.path] = r,
                );
              }
            }

            final uri = Uri.https(
              apiHost,
              '$basePath/items/${idMap[parentFolderDir.path]}:/$fileName:/createUploadSession',
            );

            final response = await _dio.postUri<Map<String, dynamic>>(
              uri,
              options: authOptions,
              data: {
                'item': {'@microsoft.graph.conflictBehavior': 'replace'},
              },
            );

            final uploadUri = Uri.parse(response.data!['uploadUrl']);
            final bytes = await file.readAsBytes();

            if (bytes.isEmpty) {
              // Throws Content-Range not found if file is empty
              continue;
            }

            await _dio.putUri(
              uploadUri,
              options: Options(
                contentType: 'application/octet-stream',
                headers: {
                  'Content-Length': bytes.length.toString(),
                },
              ),
              data: file.openRead(),
            );
          }
        }

        return ();
      },
      (error, stackTrace) {
        return error.segregateError();
      },
    );
  }

  @override
  TaskEither<AppError, ()> delete({
    required FolderModel folderModel,
    required AuthProviderModel authModel,
    required Option<String> path,
  }) {
    final authOptions = Options(headers: {
      'Authorization': 'Bearer ${authModel.accessToken}',
      'Content-Type': 'application/json'
    });
    print(authModel.accessToken);
    print(folderModel.folderId);

    return TaskEither.tryCatch(
      () async {
        final subPath = await path.match(
          () => Future.value(folderModel.folderId),
          (t) async {
            final path =
                Uri.file(t.replaceFirst(folderModel.folderPath, '')).path;

            final uri = Uri.https(apiHost,
                '$basePath/root:/SyncVault/${folderModel.folderName}$path');
            final response = await _dio.getUri(uri, options: authOptions);

            return response.data!['id'].toString();
          },
        );

        final uri = Uri.https(apiHost, '$basePath/items/$subPath');
        await _dio.deleteUri(uri, options: authOptions);
        return ();
      },
      (error, stackTrace) {
        return error.segregateError();
      },
    );
  }

  @override
  TaskEither<AppError, List<CloudFileModel>> getAllItems({
    required String accessToken,
    required Option<String> root,
    required Option<Filter> filter,
    bool flatten = true,
  }) {
    // TODO: Implement root folder
    // TODO: Apply filter or make a getOneItem fn
    final uri = Uri.https(
        apiHost,
        root.match(
          () => '$basePath/root/children',
          (t) => '$basePath/items/$t/children',
        ));
    final authOptions = Options(headers: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json'
    });

    Future<void> recExpandItems(CloudFileModel item) async {
      final uri = Uri.https(apiHost, '$basePath/items/${item.id}/children');
      final response = await _dio.getUri<Map<String, dynamic>>(
        uri,
        options: authOptions,
      );

      debugPrint(response.data.toString());
      final rawFiles = response.data!['value'] as List<dynamic>;

      for (final recItem in rawFiles) {
        if (recItem
            case {
              'id': String id,
              'name': String name,
              'parentReference': {
                'id': String parentId,
                'path': String parentPath,
              },
            }) {
          final isDirectory = recItem.containsKey('folder');
          final relativePath = parentPath.split('/drive/root:');
          final model = CloudFileModel(
            id: id,
            isDirectory: isDirectory,
            name: name,
            path: Uri.file('$relativePath$name'),
            parentId: Some(parentId),
            children: [],
          );

          if (isDirectory) {
            await recExpandItems(model);
          } else {
            item.children.add(model);
          }
        } else {
          throw const HttpError(
            'Get all files could not be parsed',
          );
        }
      }
    }

    return TaskEither.tryCatch(
      () async {
        final response = await _dio.getUri<Map<String, dynamic>>(
          uri,
          options: authOptions,
        );

        final rawFiles = response.data!['value'] as List<dynamic>;

        final files = rawFiles.map((item) {
          if (item
              case {
                'id': String id,
                'name': String name,
                'parentReference': {
                  'id': String parentId,
                  'path': String parentPath,
                },
              }) {
            final isDirectory = item.containsKey('folder');
            final relativePath = parentPath.split('/drive/root:');
            return CloudFileModel(
              id: id,
              isDirectory: isDirectory,
              name: name,
              path: Uri.file('$relativePath$name'),
              parentId: Some(parentId),
              children: [],
            );
          } else {
            throw const HttpError(
              'Get all files could not be parsed',
            );
          }
        }).toList();

        for (final item in files) {
          await recExpandItems(item);
        }

        return files;
      },
      (error, stackTrace) {
        return error.segregateError();
      },
    );
  }

  @override
  TaskEither<AppError, List<String>> getItemByFilter({
    required String accessToken,
    required Option<Filter> filter,
    required bool isInRoot,
  }) {
    // filter.match(
    //       () => files,
    //       (t) => files.where(
    //         (e) => switch (t) {
    //           DirectoryFilter(:final value) => e.isDirectory == value,
    //           IDFilter(:final value) => e.id == value,
    //           NameFilter(:final value) => e.name == value,
    //         },
    //       ),
    //     );

    throw UnimplementedError();
  }
}

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/accounts/services/drive_service.dart';

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
  TaskEither<AppError, String> upload(
    FolderModel folderModel,
    AuthProviderModel authModel,
    Option<String> filePath,
  ) {
    final authOptions = Options(headers: {
      'Authorization': 'Bearer ${authModel.accessToken}',
      'Content-Type': 'application/json'
    });

    final folder = Directory(folderModel.folderPath);
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

        return 'Success';
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

    return TaskEither.tryCatch(
      () async {
        final subPath = await path.match(
          () => Future.value('items/${folderModel.folderId}'),
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
  TaskEither<AppError, List<Map<String, dynamic>>> getAllFiles({
    required String accessToken,
    required Option<Map<String, dynamic>> filter,
  }) {
    throw UnimplementedError();
  }
}

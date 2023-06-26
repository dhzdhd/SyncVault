import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';

final dio = Dio();

abstract interface class DriveService {
  TaskEither<String, String> createFolder({
    required Option<String> folderName,
    required String accessToken,
    required Option<String> folderId,
  });
  TaskEither<String, String> upload(
    FolderModel folderModel,
    AuthProviderModel authModel,
    Option<String> filePath,
  );
  TaskEither<String, String> delete({
    required FolderModel folderModel,
    required AuthProviderModel authModel,
    required String folderId,
  });
}

class DropBox implements DriveService {
  static const apiHost = 'api.dropbox.com';
  static const basePath = '/2/files';

  @override
  TaskEither<String, String> createFolder({
    required Option<String> folderName,
    required String accessToken,
    required Option<String> folderId,
  }) {
    final uri = Uri.https(apiHost, '$basePath/create_folder_v2');
    final authOptions = Options(headers: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json'
    });

    return TaskEither.tryCatch(
      () async {
        final response = await dio.postUri<Map<String, dynamic>>(
          uri,
          options: authOptions,
          data: {
            'autorename': true,
            'path': folderName.match(
              () => '/SyncVault',
              (t) => '/SyncVault/$t',
            ),
          },
        );
        return response.data!['metadata']['id'];
      },
      (error, stackTrace) => error.toString(),
    );
  }

  @override
  TaskEither<String, String> upload(FolderModel folderModel,
      AuthProviderModel authModel, Option<String> filePath) {
    throw UnimplementedError();
  }

  @override
  TaskEither<String, String> delete(
      {required FolderModel folderModel,
      required AuthProviderModel authModel,
      required String folderId}) {
    throw UnimplementedError();
  }
}

class OneDrive implements DriveService {
  static const apiHost = 'graph.microsoft.com';
  static const basePath = '/beta/me/drive';

  @override
  TaskEither<String, String> createFolder({
    required Option<String> folderName,
    required String accessToken,
    required Option<String> folderId,
  }) {
    final subPath = folderId.match(() => 'root', (t) => 'items/$t');
    final uri = Uri.https(apiHost, '$basePath/$subPath/children');
    final authOptions = Options(headers: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json'
    });

    return TaskEither.tryCatch(
      () async {
        final response = await dio.postUri<Map<String, dynamic>>(
          uri,
          options: authOptions,
          data: {
            'name': folderName.match(() => 'SyncVault', (t) => t),
            'folder': {'childCount': 0}
          },
        );
        return response.data!['id'];
      },
      (error, stackTrace) => error.toString(),
    );
  }

  @override
  TaskEither<String, String> upload(
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
                  folderId: some(idMap[i.parent.path]!),
                ).run();

                result.match(
                  (l) => throw StateError(l),
                  (r) => idMap[i.path] = r,
                );
              }
            }

            final uri = Uri.https(
              apiHost,
              '$basePath/items/${idMap[parentFolderDir.path]}:/$fileName:/createUploadSession',
            );

            print(uri.toString());

            final response = await dio.postUri<Map<String, dynamic>>(
              uri,
              options: authOptions,
              data: {
                'item': {'@microsoft.graph.conflictBehavior': 'replace'},
              },
            );

            final uploadUri = Uri.parse(response.data!['uploadUrl']);
            final bytes = await file.readAsBytes();

            await dio.putUri(
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
      (error, stackTrace) => error.toString(),
    );
  }

  @override
  TaskEither<String, String> delete({
    required FolderModel folderModel,
    required AuthProviderModel authModel,
    required String folderId,
  }) {
    final authOptions = Options(headers: {
      'Authorization': 'Bearer ${authModel.accessToken}',
      'Content-Type': 'application/json'
    });
    final subPath = 'items/$folderId';
    final uri = Uri.https(apiHost, '$basePath/$subPath/children');

    return TaskEither.tryCatch(
      () async {
        await dio.deleteUri(uri, options: authOptions);
        return 'Success';
      },
      (error, stackTrace) {
        if (error is DioError) {
          debugPrint(error.response.toString());
        }
        return 'Failure';
      },
    );
  }
}

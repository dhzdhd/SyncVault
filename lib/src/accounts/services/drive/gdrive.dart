import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/accounts/services/drive_service.dart';

final dio = Dio();

class GoogleDrive implements DriveService {
  static const apiHost = 'www.googleapis.com';
  static const basePath = '/drive/v3';

  @override
  TaskEither<AppError, String> createFolder({
    required Option<String> folderName,
    required String accessToken,
    required Option<String> parentId,
  }) {
    final uri = Uri.https(apiHost, '$basePath/files');
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
            'mimeType': 'application/vnd.google-apps.folder',
            'name': folderName.match(
              () => 'SyncVault',
              (t) => t,
            ),
            if (parentId.isSome()) 'parents': [parentId.toNullable()!],
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

    final sessionUri = Uri.https(
      apiHost,
      '/upload$basePath/files',
      {'uploadType': 'resumable'},
    );

    final folder = Directory(folderModel.folderPath);
    final files = filePath.match(
      () => folder.listSync(recursive: true, followLinks: false),
      (t) => [File(t)],
    );
    debugPrint(files.toString());

    // final totalSize = files.fold(0, (prev, e) => prev + e.statSync().size);

    final Map<String, String> idMap = {folder.path: folderModel.folderId};

    return TaskEither.tryCatch(
      () async {
        for (final file in files) {
          if (file is File) {
            // final fileName = file.uri.pathSegments.last;
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

            final bytes = await file.readAsBytes();
            final fileSize = '${file.statSync().size}';

            if (bytes.isEmpty) {
              // Throws Content-Range not found if file is empty
              continue;
            }

            final sessionResponse = await dio.postUri<Map<String, dynamic>>(
              sessionUri,
              options: Options(headers: {
                ...authOptions.headers!,
                'X-Upload-Content-Type': 'application/octet-stream',
                'X-Upload-Content-Length': fileSize,
                'Content-Type': 'application/json;charset=UTF-8',
                'Content-Length': fileSize
              }),
              data: {
                'name': file.uri.pathSegments.last,
                'parents': [idMap[file.parent.path]]
              },
            );

            final uploadUri =
                Uri.parse(sessionResponse.headers.value('location')!);

            await dio.putUri<Map<String, dynamic>>(
              uploadUri,
              options: Options(
                contentType: 'application/octet-stream',
                headers: {
                  ...authOptions.headers!,
                  'Content-Length': fileSize,
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

    final uri = path.match(
      () => Uri.https(apiHost, '$basePath/files/${folderModel.folderId}'),
      (t) => Uri.https(''),
    );

    return TaskEither.tryCatch(() async {
      // final resp = await getAllFiles(
      //   accessToken: authModel.accessToken,
      //   filter: some({
      //     'name': Uri.file(path.toNullable()!).pathSegments.last,
      //   }),
      // ).run();
      // print(resp);

      await dio.deleteUri(uri, options: authOptions);
      return ();
    }, (error, stackTrace) => error.segregateError());

    // return TaskEither.tryCatch(
    //   () async {
    //     final subPath = await path.match(
    //       () => Future.value('items/${folderModel.folderId}'),
    //       (t) async {
    //         final path =
    //             Uri.file(t.replaceFirst(folderModel.folderPath, '')).path;

    //         final uri = Uri.https(apiHost,
    //             '$basePath/root:/SyncVault/${folderModel.folderName}$path');
    //         final response = await dio.getUri(uri, options: authOptions);

    //         return response.data!['id'].toString();
    //       },
    //     );

    //     final uri = Uri.https(apiHost, '$basePath/items/$subPath');
    //     await dio.deleteUri(uri, options: authOptions);
    //     return ();
    //   },
    //   (error, stackTrace) {
    //     return error.segregateError();
    //   },
    // );
  }

  @override
  TaskEither<AppError, List<Map<String, dynamic>>> getAllFiles({
    required String accessToken,
    required Option<Map<String, dynamic>> filter,
  }) {
    final uri = Uri.https(apiHost, '$basePath/files');
    final authOptions = Options(headers: {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json'
    });

    return TaskEither.tryCatch(
      () async {
        final response = await dio.getUri<Map<String, dynamic>>(
          uri,
          options: authOptions,
        );

        final rawFiles = response.data!['files'] as List<dynamic>;
        final files = rawFiles
            .map((e) => jsonDecode(jsonEncode(e)) as Map<String, dynamic>)
            .toList();

        filter.match(
          () => files,
          (t) => files.where(
            (e) => t.keys.any(
              (element) => e.lookup(element).match(
                    () => false,
                    (val) => val == t[element],
                  ),
            ),
          ),
        );

        return files;
      },
      (error, stackTrace) {
        return error.segregateError();
      },
    );
  }
}

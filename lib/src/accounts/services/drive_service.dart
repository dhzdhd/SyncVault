import 'dart:typed_data';

import 'package:dio/dio.dart';
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
}

class GoogleDrive implements DriveService {
  @override
  TaskEither<String, String> createFolder({
    required Option<String> folderName,
    required String accessToken,
    required Option<String> folderId,
  }) {
    throw UnimplementedError();
  }
}

class OneDrive implements DriveService {
  static const apiHost = "graph.microsoft.com";
  static const basePath = "/beta/me/drive";

  @override
  TaskEither<String, String> createFolder({
    required Option<String> folderName,
    required String accessToken,
    required Option<String> folderId,
  }) {
    final subPath = folderId.match(() => 'root', (t) => 'items/$t');
    final uri = Uri.https(apiHost, '$basePath/$subPath/children');
    final authOptions = Options(headers: {
      "Authorization": "Bearer $accessToken",
      "Content-Type": "application/json"
    });

    return TaskEither.tryCatch(
      () async {
        final response = await dio.postUri<Map<String, dynamic>>(
          uri,
          options: authOptions,
          data: {
            "name": folderName.match(() => 'SyncVault', (t) => t),
            "folder": {"childCount": 0}
          },
        );
        return response.data!["id"];
      },
      (error, stackTrace) => error.toString(),
    );
  }

  TaskEither<String, String> upload(
    FolderModel folderModel,
    AuthProviderModel authModel,
  ) {
    final uri = Uri.https(
      apiHost,
      '$basePath/items/${folderModel.folderId}/createUploadSession',
    );
    final authOptions = Options(headers: {
      "Authorization": "Bearer ${authModel.accessToken}",
      "Content-Type": "application/json"
    });

    return TaskEither.tryCatch(
      () async {
        final response = await dio.postUri<Map<String, dynamic>>(
          uri,
          options: authOptions,
          data: {
            'item': {"@microsoft.graph.conflictBehavior": "replace"},
          },
        );

        final uploadUrl = response.data!['uploadUrl'];

        return 'null';
      },
      (error, stackTrace) => error.toString(),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';

final dio = Dio();

abstract interface class DriveService {
  TaskEither<String, String> createFolder(
    FolderModel folderModel,
    AuthProviderModel authModel,
  );
}

class GoogleDrive implements DriveService {
  @override
  TaskEither<String, String> createFolder(
    FolderModel folderModel,
    AuthProviderModel authModel,
  ) {
    throw UnimplementedError();
  }
}

class OneDrive implements DriveService {
  static const apiHost = "graph.microsoft.com";
  static const basePath = "/beta/me/drive";

  @override
  TaskEither<String, String> createFolder(
    FolderModel folderModel,
    AuthProviderModel authModel,
  ) {
    final uri = Uri.https(apiHost, '$basePath/root/children');
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
            "name": folderModel.folderName,
            "folder": {"childCount": 0}
          },
        );
        return response.data!["id"];
      },
      (error, stackTrace) => error.toString(),
    );
  }
}

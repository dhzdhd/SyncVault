import 'package:dio/dio.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';

final dio = Dio();

abstract interface class DriveService {
  Future<void> createFolder(FolderModel model);
}

class GoogleDrive implements DriveService {
  @override
  Future<void> createFolder(FolderModel model) {
    throw UnimplementedError();
  }
}

class OneDrive implements DriveService {
  static const apiHost = "graph.microsoft.com";
  static const basePath = "/beta/me/drive";

  @override
  Future<void> createFolder(FolderModel model) {
    throw UnimplementedError();
  }
}

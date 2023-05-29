import 'package:dio/dio.dart';

final dio = Dio();

abstract interface class DriveService {}

class GoogleDrive implements DriveService {}

class OneDrive implements DriveService {
  static const apiHost = "graph.microsoft.com";
  static const basePath = "/beta/me/drive";
}

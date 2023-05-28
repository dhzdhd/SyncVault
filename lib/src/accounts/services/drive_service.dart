import 'package:dio/dio.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';

final dio = Dio();

abstract interface class DriveService {
  Future<dynamic> getDriveInfo(AuthProviderModel model);
}

class GoogleDrive implements DriveService {
  @override
  Future getDriveInfo(AuthProviderModel model) async {
    throw UnimplementedError();
  }
}

class OneDrive implements DriveService {
  static const apiHost = "graph.microsoft.com";
  static const basePath = "/beta/me/drive";

  @override
  Future getDriveInfo(AuthProviderModel model) async {
    final uri = Uri.https(apiHost, basePath);
    final response = await dio.getUri(uri);

    print(response.data);

    throw UnimplementedError();
  }
}

import 'package:syncvault/src/accounts/models/auth_provider_model.dart';

abstract interface class DriveService {
  Future<dynamic> getDriveInfo(AuthProviderModel model);
}

class GoogleDrive implements DriveService {
  @override
  Future getDriveInfo(AuthProviderModel model) {
    throw UnimplementedError();
  }
}

class OneDrive implements DriveService {
  @override
  Future getDriveInfo(AuthProviderModel model) {
    throw UnimplementedError();
  }
}

import 'package:fpdart/fpdart.dart';
import 'package:syncvault/src/accounts/models/file_model.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/home/models/connection_model.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/home/models/drive_provider.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';
import 'package:syncvault/src/home/models/progress_model.dart';
import 'package:syncvault/src/home/services/providers/google_drive.dart';

DriveService getManualDriveService(DriveProvider provider) {
  return switch (provider) {
    GoogleDriveProvider() => GoogleDriveService(),
    _ => throw UnimplementedError(
      'Drive service for $provider is not implemented',
    ),
  };
}

abstract interface class DriveService {
  TaskEither<AppError, FolderModel> create({
    required String folderName,
    required DriveProviderModel model,
    required Option<String> parentPath,
  });
  TaskEither<AppError, ()> delete({
    required DriveProviderModel providerModel,
    required FolderModel folderModel,
  });
  TaskEither<AppError, Option<FileModel>> treeView({
    required DriveProviderModel providerModel,
    required Option<FolderModel> folderModel,
  });
  TaskEither<AppError, List<FileModel>> listView({
    required DriveProviderModel providerModel,
    required String path,
  });
}

abstract interface class SyncService {
  Stream<Either<AppError, Option<ProgressModel>>> sync_({
    required ConnectionModel connectionModel,
    required FolderModel firstFolder,
    required DriveProviderModel firstProvider,
    required FolderModel secondFolder,
    required DriveProviderModel secondProvider,
  });
}

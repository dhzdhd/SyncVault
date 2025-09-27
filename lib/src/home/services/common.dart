import 'package:fpdart/fpdart.dart';
import 'package:syncvault/src/accounts/models/file_model.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/home/models/connection_model.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';

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
  TaskEither<AppError, ()> sync_({
    required ConnectionModel connectionModel,
    required FolderModel firstFolder,
    required DriveProviderModel firstProvider,
    required FolderModel secondFolder,
    required DriveProviderModel secondProvider,
  });
}

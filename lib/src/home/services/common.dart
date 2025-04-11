import 'package:fpdart/fpdart.dart';
import 'package:syncvault/src/accounts/models/file_model.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';

abstract interface class DriveService {
  TaskEither<AppError, FolderModel> create({
    required DriveProviderModel model,
    required String folderPath,
    required String folderName,
    required Option<String> remoteParentPath,
  });
  TaskEither<AppError, ()> upload({
    required DriveProviderModel providerModel,
    required FolderModel folderModel,
    required String localPath,
    String? rCloneExecPath,
  });
  TaskEither<AppError, ()> delete({
    required DriveProviderModel providerModel,
    required FolderModel folderModel,
  });
  TaskEither<AppError, Option<FileModel>> treeView({
    required FolderModel model,
  });
}

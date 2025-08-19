import 'package:fpdart/fpdart.dart';
import 'package:syncvault/src/accounts/models/file_model.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/home/models/connection_model.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';

abstract interface class DriveService {
  TaskEither<AppError, FolderModel> create({
    required String folderName,
    required RemoteProviderModel model,
    required Option<String> parentPath,
  });
  TaskEither<AppError, ()> upload({
    required RemoteProviderModel providerModel,
    required ConnectionModel connectionModel,
    required String localPath,
    String? rCloneExecPath,
  });
  TaskEither<AppError, ()> delete({
    required RemoteProviderModel providerModel,
    required RemoteFolderModel folderModel,
  });
  TaskEither<AppError, Option<FileModel>> treeView({
    required RemoteProviderModel model,
  });
}

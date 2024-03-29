import 'package:fpdart/fpdart.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';
import 'package:syncvault/src/accounts/models/cloud_file_model.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/accounts/models/filter.dart';

abstract interface class DriveService {
  TaskEither<AppError, String> createFolder({
    required Option<String> folderName,
    required String accessToken,
    required Option<String> parentId,
  });
  TaskEither<AppError, ()> upload(
    FolderModel folderModel,
    AuthProviderModel authModel,
    Option<String> filePath,
  );
  TaskEither<AppError, ()> delete({
    required FolderModel folderModel,
    required AuthProviderModel authModel,
    required Option<String> path,
  });
  TaskEither<AppError, List<CloudFileModel>> getAllItems({
    required String accessToken,
    required Option<String> root,
    required Option<Filter> filter,
    bool flatten,
  });
  TaskEither<AppError, List<String>> getItemByFilter({
    required String accessToken,
    required Option<Filter> filter,
    required bool isInRoot,
  });
}

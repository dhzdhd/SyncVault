import 'package:fpdart/fpdart.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/home/models/connection_model.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';

Option<DriveProviderModel> getProviderFromFolder(
  Iterable<RemoteProviderModel> providers,
  FolderModel folder,
) {
  return switch (folder) {
    RemoteFolderModel(:final remoteName) =>
      providers
          .filter((provider) => provider.remoteName == remoteName)
          .firstOption,
    LocalFolderModel() => const Some(LocalProviderModel()),
  };
}

Iterable<FolderModel> getFoldersForProvider(
  DriveProviderModel provider,
  Iterable<FolderModel> folders,
) {
  return switch (provider) {
    RemoteProviderModel(:final remoteName) => folders.filter(
      (folder) =>
          folder is RemoteFolderModel && folder.remoteName == remoteName,
    ),
    LocalProviderModel() => folders.filter(
      (folder) => folder is LocalFolderModel,
    ),
  };
}

(Option<FolderModel>, Option<FolderModel>) getFoldersFromConnection(
  ConnectionModel connection,
  Iterable<FolderModel> folders,
) {
  return (
    folders
        .filter((folder) => folder.id == connection.firstFolderId)
        .firstOption,
    folders
        .filter((folder) => folder.id == connection.secondFolderId)
        .firstOption,
  );
}

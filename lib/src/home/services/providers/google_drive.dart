import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/accounts/models/file_model.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/common/services/providers/google_utils.dart';
import 'package:syncvault/src/home/models/drive_provider_backend.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';
import 'package:syncvault/src/home/services/common.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:googleapis_auth/googleapis_auth.dart';

@singleton
class GoogleDriveService implements DriveService {
  @override
  TaskEither<AppError, FolderModel> create({
    required String title,
    required DriveProviderModel model,
  }) {
    return TaskEither.tryCatch(
      () async {
        final backend = model.backend as OAuth2;
        final httpClient = http.Client();
        print(backend.toJson());

        final authClient = authenticatedClient(
          httpClient,
          AccessCredentials(
            AccessToken(
              'Bearer',
              backend.accessToken,
              DateTime.now()
                  .add(Duration(seconds: int.parse(backend.expiresIn)))
                  .toUtc(),
            ),
            backend.refreshToken,
            GoogleUtils.scopes,
          ),
        );
        final api = drive.DriveApi(authClient);
        final fileList = await api.files.list(
          q: "name = 'SyncVault' and mimeType = 'application/vnd.google-apps.folder'",
          spaces: 'drive',
        );

        // Check if SyncVault folder exists and get its ID
        late final String parentFolderId;
        if (fileList.files!.isEmpty) {
          final folderMetadata = drive.File(
            // name: remoteParentPath.match(
            //   () => 'SyncVault/',
            //   (t) => t.replaceAll('/', ''),
            // ),
            name: '',
            mimeType: 'application/vnd.google-apps.folder',
          );
          final syncVaultFolder = await api.files.create(folderMetadata);
          parentFolderId = syncVaultFolder.id!;
        } else {
          parentFolderId = fileList.files!.first.id!;
        }

        // Create the new folder
        final folderMetadata = drive.File(
          name: model.remoteName,
          mimeType: 'application/vnd.google-apps.folder',
          parents: [parentFolderId],
        );
        final folder = await api.files.create(folderMetadata);

        httpClient.close();

        return FolderModel(
          title: '',
          firstRemote: model.remoteName,
          secondRemote: '',
          isAutoSync: false,
          isDeletionEnabled: false,
          isTwoWaySync: false,
          folderId: folder.id,
        );
      },
      (error, stackTrace) {
        return ProviderError(
          model.provider,
          ProviderOperationType.remoteCreation,
          error,
          stackTrace,
        ).logError();
      },
    );
  }

  @override
  TaskEither<AppError, ()> upload({
    required DriveProviderModel providerModel,
    required FolderModel folderModel,
    required String localPath,
    String? rCloneExecPath,
  }) {
    // TODO: implement upload
    throw UnimplementedError();
  }

  @override
  TaskEither<AppError, ()> delete({
    required DriveProviderModel providerModel,
    required FolderModel folderModel,
  }) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  TaskEither<AppError, Option<FileModel>> treeView({
    required DriveProviderModel model,
  }) {
    // TODO: implement treeView
    throw UnimplementedError();
  }
}

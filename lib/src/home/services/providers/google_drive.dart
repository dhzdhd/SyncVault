import 'package:fpdart/fpdart.dart';
import 'package:hashlib/random.dart';
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
    required String folderName,
    required DriveProviderModel model,
    required Option<String> parentPath,
  }) {
    return TaskEither.tryCatch(
      () async {
        final backend = (model as RemoteProviderModel).backend as OAuth2;
        final httpClient = http.Client();

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

        return RemoteFolderModel(
          id: uuid.v4(),
          folderName: '',
          remoteName: model.remoteName,
          parentPath: '',
          folderId: folder.id,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
      },
      (error, stackTrace) {
        return GeneralError('', error, stackTrace).logError();
      },
    );
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
    required DriveProviderModel providerModel,
    required Option<FolderModel> folderModel,
  }) {
    // TODO: implement treeView
    throw UnimplementedError();
  }

  @override
  TaskEither<AppError, List<FileModel>> listView({
    required DriveProviderModel providerModel,
    required String path,
  }) {
    // TODO: implement listView
    throw UnimplementedError();
  }
}

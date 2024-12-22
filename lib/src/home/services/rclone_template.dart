import 'package:syncvault/src/home/models/drive_provider_backend.dart';
import 'package:syncvault/src/home/services/rclone.dart';

final Map<DriveProvider,
        Map<String, String> Function(String, DriveProviderBackend)>
    providerTemplate = {
  DriveProvider.oneDrive: (String remoteName, DriveProviderBackend payload) => {
        'remoteName': remoteName,
        'type': 'onedrive',
        'token': (payload as OAuth2).rCloneJson.toString(),
        'drive_id': '',
        'drive_type': 'personal',
      },
  DriveProvider.googleDrive:
      (String remoteName, DriveProviderBackend payload) => {
            'remoteName': remoteName,
            'type': 'drive',
            'token': (payload as OAuth2).rCloneJson.toString(),
            'team_drive': '',
          },
  DriveProvider.dropBox: (String remoteName, DriveProviderBackend payload) => {
        'remoteName': remoteName,
        'type': 'dropbox',
        'token': (payload as OAuth2).rCloneJson.toString(),
      },
  DriveProvider.nextCloud: (String remoteName, DriveProviderBackend payload) =>
      {
        'remoteName': remoteName,
        'type': 'webdav',
        'url': (payload as Webdav).url,
        'vendor': 'nextcloud',
        'user': payload.user,
        'pass': payload.password,
      },
};

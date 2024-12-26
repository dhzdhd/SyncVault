import 'dart:convert';

import 'package:syncvault/src/home/models/drive_provider_backend.dart';
import 'package:syncvault/src/home/services/rclone.dart';

final Map<DriveProvider, Map<String, String> Function(DriveProviderBackend)>
    providerTemplate = {
  DriveProvider.oneDrive: (DriveProviderBackend payload) => {
        'type': 'onedrive',
        'token': jsonEncode((payload as OAuth2).rCloneJson),
        'drive_id': '',
        'drive_type': 'personal',
      },
  DriveProvider.googleDrive: (DriveProviderBackend payload) => {
        'type': 'drive',
        'token': jsonEncode((payload as OAuth2).rCloneJson),
        'team_drive': '',
      },
  DriveProvider.dropBox: (DriveProviderBackend payload) => {
        'type': 'dropbox',
        'token': jsonEncode((payload as OAuth2).rCloneJson),
      },
  DriveProvider.nextCloud: (DriveProviderBackend payload) => {
        'type': 'webdav',
        'url': (payload as Webdav).url,
        'vendor': 'nextcloud',
        'user': payload.user,
        'pass': payload.password,
      },
};

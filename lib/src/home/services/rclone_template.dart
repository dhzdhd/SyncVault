import 'dart:convert';

import 'package:syncvault/src/common/models/drive_provider.dart';
import 'package:syncvault/src/home/models/drive_provider_backend.dart';

final Map<DriveProvider, Map<String, String> Function(DriveProviderBackend)>
    providerTemplate = {
  DriveProvider.oneDrive: (DriveProviderBackend backend) => {
        'type': 'onedrive',
        'token': jsonEncode((backend as OAuth2).authJson),
        'drive_id': '',
        'drive_type': 'personal',
      },
  DriveProvider.googleDrive: (DriveProviderBackend backend) => {
        'type': 'drive',
        'token': jsonEncode((backend as OAuth2).authJson),
        'team_drive': '',
      },
  DriveProvider.dropBox: (DriveProviderBackend backend) => {
        'type': 'dropbox',
        'token': jsonEncode((backend as OAuth2).authJson),
      },
  DriveProvider.protonDrive: (DriveProviderBackend backend) => {
        'username': (backend as UserPassword).username,
        'password': backend.password
      },
  DriveProvider.minio: (DriveProviderBackend backend) => {
        'type': 's3',
        'provider': 'Minio',
        'access_key_id': (backend as S3).accessKeyId,
        'secret_access_key': backend.secretAccessKey,
        'endpoint': backend.url,
        'acl': 'bucket-owner-full-control'
      },
  DriveProvider.nextCloud: (DriveProviderBackend backend) => {
        'type': 'webdav',
        'url': (backend as Webdav).url,
        'vendor': 'nextcloud',
        'user': backend.user,
        'pass': backend.password,
      },
};

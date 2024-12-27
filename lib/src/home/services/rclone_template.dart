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
  DriveProvider.protonDrive: (DriveProviderBackend payload) => {
        'username': (payload as UserPassword).username,
        'password': payload.password
      },
  DriveProvider.minio: (DriveProviderBackend payload) => {
        'type': 's3',
        'provider': 'Minio',
        'access_key_id': (payload as S3).accessKeyId,
        'secret_access_key': payload.secretAccessKey,
        'endpoint': payload.url,
        'acl': 'bucket-owner-full-control'
      },
  DriveProvider.nextCloud: (DriveProviderBackend payload) => {
        'type': 'webdav',
        'url': (payload as Webdav).url,
        'vendor': 'nextcloud',
        'user': payload.user,
        'pass': payload.password,
      },
};

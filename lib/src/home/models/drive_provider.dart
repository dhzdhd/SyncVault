import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/home/models/drive_provider_backend.dart';

part 'drive_provider.freezed.dart';
part 'drive_provider.g.dart';

@freezed
sealed class DriveProvider with _$DriveProvider {
  const DriveProvider._();

  const factory DriveProvider.oneDrive() = OneDriveProvider;
  const factory DriveProvider.googleDrive() = GoogleDriveProvider;
  const factory DriveProvider.dropBox() = DropBoxProvider;
  const factory DriveProvider.protonDrive() = ProtonDriveProvider;
  const factory DriveProvider.minio() = MinioProvider;
  const factory DriveProvider.nextCloud() = NextCloudProvider;
  const factory DriveProvider.local() = LocalProvider;

  String get providerName => switch (this) {
    OneDriveProvider() => 'onedrive',
    GoogleDriveProvider() => 'drive',
    DropBoxProvider() => 'dropbox',
    ProtonDriveProvider() => 'protondrive',
    MinioProvider() => 's3',
    NextCloudProvider() => 'webdav',
    LocalProvider() => 'local',
  };

  String get displayName => switch (this) {
    OneDriveProvider() => 'OneDrive',
    GoogleDriveProvider() => 'Google Drive',
    DropBoxProvider() => 'Dropbox',
    ProtonDriveProvider() => 'Proton Drive',
    MinioProvider() => 'Minio',
    NextCloudProvider() => 'NextCloud',
    LocalProvider() => 'Local',
  };

  String get providerIcon => switch (this) {
    OneDriveProvider() => 'assets/logos/onedrive.svg',
    GoogleDriveProvider() => 'assets/logos/gdrive.svg',
    DropBoxProvider() => 'assets/logos/dropbox.svg',
    ProtonDriveProvider() => 'assets/logos/protondrive.svg',
    MinioProvider() => 'assets/logos/minio.svg',
    NextCloudProvider() => 'assets/logos/nextcloud.svg',
    LocalProvider() => '',
  };

  DriveProviderBackend get defaultBackend => switch (this) {
    OneDriveProvider() ||
    GoogleDriveProvider() ||
    DropBoxProvider() => const OAuth2(
      authJson: {},
      accessToken: '',
      refreshToken: '',
      expiresIn: '',
    ),
    ProtonDriveProvider() => const UserPassword(username: '', password: ''),
    MinioProvider() => const S3(url: '', accessKeyId: '', secretAccessKey: ''),
    NextCloudProvider() => const Webdav(url: '', user: '', password: ''),
    LocalProvider() => const Local(folderPath: ''),
  };

  bool validateBackend(DriveProviderBackend backend) => switch (this) {
    OneDriveProvider() ||
    GoogleDriveProvider() ||
    DropBoxProvider() => backend is OAuth2,
    ProtonDriveProvider() => backend is UserPassword,
    MinioProvider() => backend is S3,
    NextCloudProvider() => backend is Webdav,
    LocalProvider() => backend is Local,
  };

  static List<DriveProvider> get allProviders => [
    const DriveProvider.oneDrive(),
    const DriveProvider.googleDrive(),
    const DriveProvider.dropBox(),
    const DriveProvider.protonDrive(),
    const DriveProvider.minio(),
    const DriveProvider.nextCloud(),
    const DriveProvider.local(),
  ];

  static Option<DriveProvider> getProviderByName(String name) {
    return allProviders
        .filter((provider) => provider.providerName == name)
        .firstOption;
  }

  Either<AppError, Map<String, String>> rCloneTemplate(
    DriveProviderBackend backend,
  ) {
    return switch ((this, backend)) {
      (OneDriveProvider(), OAuth2(:final authJson)) => Right({
        'type': 'onedrive',
        'token': jsonEncode(authJson),
        'drive_id': '',
        'drive_type': 'personal',
      }),
      (GoogleDriveProvider(), OAuth2(:final authJson)) => Right({
        'type': 'drive',
        'token': jsonEncode(authJson),
        'team_drive': '',
      }),
      (DropBoxProvider(), OAuth2(:final authJson)) => Right({
        'type': 'dropbox',
        'token': jsonEncode(authJson),
      }),
      (ProtonDriveProvider(), UserPassword(:final username, :final password)) =>
        Right({
          'type': 'protondrive',
          'username': username,
          'password': password,
        }),
      (
        MinioProvider(),
        S3(:final accessKeyId, :final secretAccessKey, :final url),
      ) =>
        Right({
          'type': 's3',
          'provider': 'Minio',
          'access_key_id': accessKeyId,
          'secret_access_key': secretAccessKey,
          'endpoint': url,
          'acl': 'bucket-owner-full-control',
        }),
      (NextCloudProvider(), Webdav(:final url, :final user, :final password)) =>
        Right({
          'type': 'webdav',
          'url': url,
          'vendor': 'nextcloud',
          'user': user,
          'pass': password,
        }),
      _ => Left(
        GeneralError(
          'Invalid provider-backend combination: $runtimeType with ${backend.runtimeType}',
        ),
      ),
    };
  }

  factory DriveProvider.fromJson(Map<String, Object?> json) =>
      _$DriveProviderFromJson(json);
}

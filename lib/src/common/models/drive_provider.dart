import 'package:fpdart/fpdart.dart';

import 'package:syncvault/src/home/models/drive_provider_backend.dart';
import 'package:syncvault/src/home/services/rclone_template.dart';

enum DDriveProvider {
  oneDrive('onedrive', 'OneDrive', 'assets/logos/onedrive.svg', OAuth2),
  googleDrive('drive', 'Google Drive', 'assets/logos/gdrive.svg', OAuth2),
  dropBox('dropbox', 'Dropbox', 'assets/logos/dropbox.svg', OAuth2),
  protonDrive(
    'protondrive',
    'Proton Drive',
    'assets/logos/protondrive.svg',
    UserPassword,
  ),
  minio('s3', 'Minio', 'assets/logos/minio.svg', S3),
  nextCloud('webdav', 'NextCloud', 'assets/logos/nextcloud.svg', Webdav),
  local('local', 'Local', '', Local);

  Option<Map<String, String>> template({
    required DriveProviderBackend backend,
  }) {
    return Option.fromNullable(
      providerTemplate[this],
    ).map((func) => func(backend));
  }

  static Option<DDriveProvider> getProviderByName(String name) {
    return DDriveProvider.values
        .filter((value) => value.providerName == name)
        .firstOption;
  }

  const DDriveProvider(
    this.providerName,
    this.displayName,
    this.providerIcon,
    this.backendType,
  );

  final String providerName;
  final String displayName;
  final String providerIcon;
  final Type backendType;
}

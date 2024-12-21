import 'package:freezed_annotation/freezed_annotation.dart';

part 'drive_provider_backend_payload.freezed.dart';
part 'drive_provider_backend_payload.g.dart';

@freezed
sealed class DriveProviderBackendPayload with _$DriveProviderBackendPayload {
  const factory DriveProviderBackendPayload.oauth2({
    required String remoteName,
  }) = OAuth2Payload;
  const factory DriveProviderBackendPayload.s3({required String remoteName}) =
      S3Payload;
  const factory DriveProviderBackendPayload.webdav({
    required String remoteName,
    required String url,
    required String user,
    required String password,
  }) = WebdavPayload;

  factory DriveProviderBackendPayload.fromJson(Map<String, Object?> json) =>
      _$DriveProviderBackendPayloadFromJson(json);
}

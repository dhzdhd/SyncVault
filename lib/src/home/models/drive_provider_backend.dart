import 'package:freezed_annotation/freezed_annotation.dart';

part 'drive_provider_backend.freezed.dart';
part 'drive_provider_backend.g.dart';

@freezed
sealed class DriveProviderBackend with _$DriveProviderBackend {
  const factory DriveProviderBackend.oauth2({
    required Map<String, dynamic> rCloneJson,
    required String accessToken,
    required String refreshToken,
    required String expiresIn,
  }) = OAuth2;
  const factory DriveProviderBackend.s3() = S3;
  const factory DriveProviderBackend.webdav({
    required String url,
    required String user,
    required String password,
  }) = Webdav;

  factory DriveProviderBackend.fromJson(Map<String, Object?> json) =>
      _$DriveProviderBackendFromJson(json);
}

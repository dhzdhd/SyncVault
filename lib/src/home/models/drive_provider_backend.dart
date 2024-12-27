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
  const factory DriveProviderBackend.s3({
    required String url,
    required String accessKeyId,
    required String secretAccessKey,
  }) = S3;
  const factory DriveProviderBackend.webdav({
    required String url,
    required String user,
    required String password,
  }) = Webdav;
  const factory DriveProviderBackend.userPassword({
    required String username,
    required String password,
  }) = UserPassword;

  factory DriveProviderBackend.fromJson(Map<String, Object?> json) =>
      _$DriveProviderBackendFromJson(json);
}

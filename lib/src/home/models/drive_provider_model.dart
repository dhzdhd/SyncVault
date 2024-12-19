import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:syncvault/src/home/services/rclone.dart';

part 'drive_provider_model.freezed.dart';
part 'drive_provider_model.g.dart';

@freezed
class DriveProviderModel with _$DriveProviderModel {
  const factory DriveProviderModel({
    required String remoteName,
    required DriveProvider provider,
    required String accessToken,
    required String refreshToken,
    required String expiresIn,
    required Map<dynamic, dynamic> rCloneJson,
  }) = _DriveProviderModel;

  factory DriveProviderModel.fromJson(Map<String, Object?> json) =>
      _$DriveProviderModelFromJson(json);
}

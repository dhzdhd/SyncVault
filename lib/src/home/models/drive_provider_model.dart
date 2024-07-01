import 'package:freezed_annotation/freezed_annotation.dart';

part 'drive_provider_model.freezed.dart';
part 'drive_provider_model.g.dart';

@freezed
class DriveProviderModel with _$DriveProviderModel {
  const factory DriveProviderModel({
    required String accessToken,
    required String refreshToken,
    required String expiresIn,
  }) = _DriveProviderModel;

  factory DriveProviderModel.fromJson(Map<String, Object?> json) =>
      _$DriveProviderModelFromJson(json);
}

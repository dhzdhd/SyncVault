import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:syncvault/src/home/models/drive_provider.dart';
import 'package:syncvault/src/home/models/drive_provider_backend.dart';

part 'drive_provider_model.freezed.dart';
part 'drive_provider_model.g.dart';

@freezed
abstract class DriveProviderModel with _$DriveProviderModel {
  const factory DriveProviderModel({
    required String remoteName,
    required DriveProvider provider,
    required DriveProviderBackend backend,
    required String createdAt,
    required String updatedAt,
    required bool isRCloneBackend,
  }) = _DriveProviderModel;

  factory DriveProviderModel.fromJson(Map<String, Object?> json) =>
      _$DriveProviderModelFromJson(json);
}

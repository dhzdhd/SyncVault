import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:syncvault/src/home/models/drive_provider.dart';
import 'package:syncvault/src/home/models/drive_provider_backend.dart';

part 'drive_provider_model.freezed.dart';
part 'drive_provider_model.g.dart';

@freezed
sealed class DriveProviderModel with _$DriveProviderModel {
  const factory DriveProviderModel.remote({
    required String remoteName,
    required DriveProvider provider,
    required DriveProviderBackend backend,
    required bool isRCloneBackend,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = RemoteProviderModel;
  const factory DriveProviderModel.local() = LocalProviderModel;

  factory DriveProviderModel.fromJson(Map<String, Object?> json) =>
      _$DriveProviderModelFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:syncvault/src/home/services/rclone.dart';

part 'remote_folder_model.freezed.dart';
part 'remote_folder_model.g.dart';

@freezed
class RemoteFolderModel with _$RemoteFolderModel {
  const factory RemoteFolderModel({
    // required String email,
    required DriveProvider provider,
    // required String folderPath,
    // required String folderName,
    // required String folderId,
    // required bool isAutoSync,
    // required bool isDeletionEnabled,
    // required bool isTwoWaySync,
    // required List<CloudFileModel> files,
  }) = _RemoteFolderModel;

  factory RemoteFolderModel.fromJson(Map<String, Object?> json) =>
      _$RemoteFolderModelFromJson(json);
}

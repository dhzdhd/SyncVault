// dart run build_runner build

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:syncvault/src/home/models/drive_provider.dart';

part 'folder_model.freezed.dart';
part 'folder_model.g.dart';

@freezed
// TODO: Convert nullables to option when adapter is fixed
abstract class FolderModel with _$FolderModel {
  const factory FolderModel({
    required String remoteName,
    required DriveProvider provider,
    required String folderPath,
    required String folderName,
    required String? remoteParentPath,
    required bool isAutoSync,
    required bool isDeletionEnabled,
    required bool isTwoWaySync,
    required String? folderId,
    required bool isRCloneBackend,
  }) = _FolderModel;

  factory FolderModel.fromJson(Map<String, Object?> json) =>
      _$FolderModelFromJson(json);
}

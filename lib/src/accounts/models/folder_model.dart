// dart run build_runner build

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/models/file_model.dart';

part 'folder_model.freezed.dart';
part 'folder_model.g.dart';

@freezed
class FolderModel with _$FolderModel {
  const factory FolderModel({
    required String email,
    required AuthProviderType provider,
    required String folderPath,
    required String folderName,
    required String folderId,
    required bool isAutoSync,
    required bool isDeletionEnabled,
    required List<FileModel> files,
  }) = _FolderModel;

  factory FolderModel.fromJson(Map<String, Object?> json) =>
      _$FolderModelFromJson(json);
}

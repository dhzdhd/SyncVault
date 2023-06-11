// flutter pub run build_runner build

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'folder_info_model.freezed.dart';
part 'folder_info_model.g.dart';

@freezed
class FolderInfoModel with _$FolderInfoModel {
  const factory FolderInfoModel({
    required int remainingStorage,
    required int usedStorage,
  }) = _FolderInfoModel;

  factory FolderInfoModel.fromJson(Map<String, Object?> json) =>
      _$FolderInfoModelFromJson(json);
}

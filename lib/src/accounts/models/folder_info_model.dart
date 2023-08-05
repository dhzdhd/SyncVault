// flutter pub run build_runner build

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'folder_info_model.freezed.dart';

@freezed
class FolderInfoModel with _$FolderInfoModel {
  const factory FolderInfoModel({
    required int remainingStorage,
    required int usedStorage,
    required int totalStorage,
  }) = _FolderInfoModel;
}

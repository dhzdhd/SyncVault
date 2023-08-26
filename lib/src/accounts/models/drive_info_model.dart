// dart run build_runner build

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'drive_info_model.freezed.dart';

@freezed
class DriveInfoModel with _$DriveInfoModel {
  const factory DriveInfoModel({
    required int remainingStorage,
    required int usedStorage,
    required int totalStorage,
  }) = _DriveInfoModel;
}

// dart run build_runner build

import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'drive_info_model.freezed.dart';

@freezed
class DriveInfoModel with _$DriveInfoModel {
  const factory DriveInfoModel({
    required Option<double> remainingStorage,
    required Option<double> usedStorage,
    required Option<double> totalStorage,
  }) = _DriveInfoModel;
}

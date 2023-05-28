// flutter pub run build_runner build

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';

part 'drive_model.freezed.dart';
part 'drive_model.g.dart';

@freezed
class DriveModel with _$DriveModel {
  const factory DriveModel({
    // Can change to pointer to authProvider to remove redundancy
    required List<AuthProviderModel> models,
    required String localPath,
  }) = _DriveModel;

  factory DriveModel.fromJson(Map<String, Object?> json) =>
      _$DriveModelFromJson(json);
}

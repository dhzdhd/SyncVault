// flutter pub run build_runner build

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';

part 'auth_provider_model.freezed.dart';
part 'auth_provider_model.g.dart';

@freezed
class AuthProviderModel with _$AuthProviderModel {
  const factory AuthProviderModel({
    required String accessToken,
    required String refreshToken,
    required int expiresIn,
    required AuthProvider provider,
    required String name,
    required String email,
    required String createdAt,
    required int remainingStorage,
    required int usedStorage,
  }) = _AuthProviderModel;

  factory AuthProviderModel.fromJson(Map<String, Object?> json) =>
      _$AuthProviderModelFromJson(json);
}

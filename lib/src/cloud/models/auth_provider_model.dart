// flutter pub run build_runner build

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'auth_provider_model.freezed.dart';
part 'auth_provider_model.g.dart';

@freezed
class AuthProviderModel with _$AuthProviderModel {
  const factory AuthProviderModel({
    required String firstName,
    required String lastName,
    required int age,
  }) = _AuthProviderModel;

  factory AuthProviderModel.fromJson(Map<String, Object?> json) =>
      _$AuthProviderModelFromJson(json);
}

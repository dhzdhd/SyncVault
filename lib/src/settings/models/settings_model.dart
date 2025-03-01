// dart run build_runner build

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_model.freezed.dart';
part 'settings_model.g.dart';

@freezed
class SettingsModel with _$SettingsModel {
  const factory SettingsModel({
    required bool isSentryEnabled,
    required bool isHideOnStartup,
    required ThemeMode themeMode,
  }) = _SettingsModel;

  factory SettingsModel.fromJson(Map<String, Object?> json) =>
      _$SettingsModelFromJson(json);

  factory SettingsModel.defaultValue() => const SettingsModel(
        isSentryEnabled: false,
        isHideOnStartup: false,
        themeMode: ThemeMode.system,
      );
}

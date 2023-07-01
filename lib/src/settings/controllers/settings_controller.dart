import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:syncvault/src/settings/models/settings_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/settings_service.dart';

part 'settings_controller.g.dart';

@riverpod
class Settings extends _$Settings {
  @override
  SettingsModel build() {
    return init();
  }

  static SettingsModel init() {
    final Map<String, dynamic> raw = jsonDecode(
      Hive.box('vault').get(
        'settings',
        defaultValue: jsonEncode(
          const SettingsModel(
            isSentryEnabled: false,
          ).toJson(),
        ),
      ),
    );

    return SettingsModel.fromJson(raw);
  }

  void setSentry(Option<bool> choice) {
    state = state.copyWith(
      isSentryEnabled: choice.match(
        () => !state.isSentryEnabled,
        (t) => t,
      ),
    );
    Hive.box('vault').put('settings', jsonEncode(state.toJson()));
  }
}

class SettingsController with ChangeNotifier {
  SettingsController(this._settingsService);

  final SettingsService _settingsService;
  late ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;

  Future<void> loadSettings() async {
    _themeMode = await _settingsService.themeMode();
    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;
    if (newThemeMode == _themeMode) return;

    _themeMode = newThemeMode;
    notifyListeners();

    await _settingsService.updateThemeMode(newThemeMode);
  }
}

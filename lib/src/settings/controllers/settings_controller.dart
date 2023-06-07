import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/settings/models/settings_model.dart';

import '../services/settings_service.dart';

final settingsProvider =
    StateNotifierProvider<SettingsNotifier, SettingsModel>((ref) {
  return SettingsNotifier(ref);
});

class SettingsNotifier extends StateNotifier<SettingsModel> {
  SettingsNotifier(this.ref) : super(init());

  late final StateNotifierProviderRef<SettingsNotifier, SettingsModel> ref;

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

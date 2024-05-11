import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:syncvault/log.dart';
import 'package:syncvault/src/settings/models/settings_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_controller.g.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 0, 76, 109),
    brightness: Brightness.light,
  ),
);
final darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 0, 76, 109),
    brightness: Brightness.dark,
  ),
);

// TODO: Move all box updates to a settings repository
@riverpod
class Settings extends _$Settings {
  @override
  SettingsModel build() {
    return init();
  }

  static SettingsModel init() {
    const defaultValue =
        SettingsModel(isSentryEnabled: false, themeMode: ThemeMode.system);

    try {
      final Map<String, dynamic> raw = jsonDecode(
        Hive.box('vault').get(
          'settings',
          defaultValue: jsonEncode(defaultValue.toJson()),
        ),
      );

      return SettingsModel.fromJson(raw);
    } catch (err) {
      // TODO: Silently fails if box not working. Might have to refactor
      debugLogger.e('SettingsModel failed to initialize');
      fileLogger.e('SettingsModel failed to initialize');

      return defaultValue;
    }
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

  void updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == state.themeMode || newThemeMode == null) return;

    state = state.copyWith(themeMode: newThemeMode);
    Hive.box('vault').put('settings', jsonEncode(state.toJson()));
  }
}

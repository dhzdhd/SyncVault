import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';
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

final _box = GetIt.I<Box<SettingsModel>>();

// TODO: Move all box updates to a settings repository
// TODO: https://ms3byoussef.medium.com/hive-in-flutter-a-detailed-guide-with-injectable-freezed-and-cubit-in-clean-architecture-c5c12ce8e00c
@riverpod
class Settings extends _$Settings {
  @override
  SettingsModel build() {
    return init();
  }

  static SettingsModel init() {
    final defaultValue = SettingsModel.defaultValue();

    try {
      // final Map<String, dynamic> raw = jsonDecode(
      // return _box.get(
      //   'settings',
      //   defaultValue: jsonEncode(defaultValue.toJson()),
      // )!;
      // );

      // return SettingsModel.fromJson(raw);
      return _box.get('settings', defaultValue: defaultValue)!;
    } catch (err) {
      print(
        Hive.box('settings').get(
          'settings',
          defaultValue: jsonEncode(defaultValue.toJson()),
        ),
      );
      // TODO: Fails if box not working. Might have to refactor
      debugLogger.e('SettingsModel failed to initialize');
      fileLogger.e('SettingsModel failed to initialize');

      return defaultValue;
    }
  }

  void setSentry({Option<bool> choice = const None()}) {
    state = state.copyWith(
      isSentryEnabled: choice.match(
        () => !state.isSentryEnabled,
        (t) => t,
      ),
    );
    // Hive.box('settings').put('settings', jsonEncode(state.toJson()));
    _box.put('settings', state);
  }

  void setHideOnStartup({Option<bool> choice = const None()}) {
    state = state.copyWith(
      isHideOnStartup: choice.match(
        () => !state.isHideOnStartup,
        (t) => t,
      ),
    );
    // Hive.box('settings').put('settings', jsonEncode(state.toJson()));
    _box.put('settings', state);
  }

  void updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == state.themeMode || newThemeMode == null) {
      return;
    }

    state = state.copyWith(themeMode: newThemeMode);
    // Hive.box('settings').put('settings', jsonEncode(state.toJson()));
    _box.put('settings', state);
  }
}

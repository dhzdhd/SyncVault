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

// TODO: Move all box updates to a settings repository
@riverpod
class Settings extends _$Settings {
  static const settingsKey = 'settings';

  static final defaultValue = SettingsModel.defaultValue();
  static final _box = GetIt.I<Box<SettingsModel>>();

  @override
  SettingsModel build() {
    return init();
  }

  static SettingsModel init() {
    try {
      return _box.get(settingsKey, defaultValue: defaultValue)!;
    } catch (err) {
      debugLogger.e('SettingsModel failed to initialize');
      // TODO: Fix file logger

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
    _box.put(settingsKey, state);
  }

  void setHideOnStartup({Option<bool> choice = const None()}) {
    state = state.copyWith(
      isHideOnStartup: choice.match(
        () => !state.isHideOnStartup,
        (t) => t,
      ),
    );
    _box.put(settingsKey, state);
  }

  void setRCloneDefaultBackend({Option<bool> choice = const None()}) {
    state = state.copyWith(
      isRCloneDefault: choice.match(
        () => !state.isRCloneDefault,
        (t) => t,
      ),
    );
    _box.put(settingsKey, state);
  }

  void updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == state.themeMode || newThemeMode == null) {
      return;
    }

    state = state.copyWith(themeMode: newThemeMode);
    _box.put(settingsKey, state);
  }

  void resetSettings() async {
    state = defaultValue;
    _box.put(settingsKey, state);
  }
}

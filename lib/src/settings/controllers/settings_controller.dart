import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';
import 'package:syncvault/log.dart';
import 'package:syncvault/src/common/services/hive_storage.dart';
import 'package:syncvault/src/common/services/rclone.dart';
import 'package:syncvault/src/settings/models/settings_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_controller.g.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 0, 76, 109),
    brightness: Brightness.light,
  ),
  fontFamily: 'Inter',
);
final darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 0, 76, 109),
    brightness: Brightness.dark,
  ),
  fontFamily: 'Inter',
);

@riverpod
class Settings extends _$Settings {
  static const settingsKey = 'settings';

  static final defaultValue = SettingsModel.defaultValue();
  static final _box = GetIt.I<Box<SettingsModel>>();
  static final _storage = HiveStorage(_box);

  @override
  Future<SettingsModel> build() async {
    return init();
  }

  static Future<SettingsModel> init() async {
    final rCloneExecResult = await RCloneUtils().getRCloneExec().run();

    try {
      final value = defaultValue.copyWith(
        rClonePath: rCloneExecResult.toNullable()!,
      );

      return _box.get(settingsKey, defaultValue: value)!;
    } catch (err) {
      debugLogger.e('SettingsModel failed to initialize');
      // TODO: Fix file logger

      return defaultValue;
    }
  }

  Future<void> toggleSentryEnabled({Option<bool> choice = const None()}) async {
    state = switch (state) {
      AsyncData(:final value) => AsyncData(
        value.copyWith(
          isSentryEnabled: choice.match(() => !value.isSentryEnabled, (t) => t),
        ),
      ),
      final x => x,
    };

    await _storage.updateSingleAsyncValue(settingsKey, state);
  }

  Future<void> toggleHideOnStartup({Option<bool> choice = const None()}) async {
    state = switch (state) {
      AsyncData(:final value) => AsyncData(
        value.copyWith(
          isHideOnStartup: choice.match(() => !value.isHideOnStartup, (t) => t),
        ),
      ),
      final x => x,
    };

    await _storage.updateSingleAsyncValue(settingsKey, state);
  }

  Future<void> toggleLaunchOnStartup({
    Option<bool> choice = const None(),
  }) async {
    state = switch (state) {
      AsyncData(:final value) => AsyncData(
        value.copyWith(
          isLaunchOnStartup: choice.match(
            () => !value.isLaunchOnStartup,
            (t) => t,
          ),
        ),
      ),
      final x => x,
    };

    await _storage.updateSingleAsyncValue(settingsKey, state);
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    state = switch (state) {
      AsyncData(:final value)
          when (newThemeMode != null && newThemeMode != value.themeMode) =>
        AsyncData(value.copyWith(themeMode: newThemeMode)),
      final x => x,
    };
    await _storage.updateSingleAsyncValue(settingsKey, state);
  }

  Future<void> updateRClonePath({required String path}) async {
    state = switch (state) {
      AsyncData(:final value) => AsyncData(value.copyWith(rClonePath: path)),
      final x => x,
    };
    await _storage.updateSingleAsyncValue(settingsKey, state);
  }

  Future<void> resetSettings() async {
    final rCloneExecResult = await RCloneUtils().getRCloneExec().run();

    try {
      state = AsyncData(
        defaultValue.copyWith(rClonePath: rCloneExecResult.toNullable()!),
      );
    } catch (err) {
      state = AsyncData(defaultValue);
    }

    await _storage.updateSingleAsyncValue(settingsKey, state);
  }
}

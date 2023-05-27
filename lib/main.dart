import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'src/app.dart';
import 'src/settings/controllers/settings_controller.dart';
import 'src/settings/services/settings_service.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());

  await settingsController.loadSettings();

  await Hive.initFlutter();
  await Hive.openBox('vault');

  runApp(
    ProviderScope(
      child: MyApp(settingsController: settingsController),
    ),
  );
}

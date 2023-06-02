import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:system_tray/system_tray.dart';
import 'package:window_manager/window_manager.dart';

import 'src/app.dart';
import 'src/settings/controllers/settings_controller.dart';
import 'src/settings/services/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows) {
    final appWindow = AppWindow();
    final systemTray = SystemTray();

    await systemTray.initSystemTray(
      title: 'Sync Vault',
      iconPath: 'assets/icons/icon.ico',
    );

    final menu = Menu();
    await menu.buildFrom([
      MenuItemLabel(label: 'Show', onClicked: (menuItem) => appWindow.show())
    ]);

    await systemTray.setContextMenu(menu);

    systemTray.registerSystemTrayEventHandler((eventName) {
      debugPrint("eventName: $eventName");
      if (eventName == kSystemTrayEventClick) {
        Platform.isWindows ? appWindow.show() : systemTray.popUpContextMenu();
      } else if (eventName == kSystemTrayEventRightClick) {
        Platform.isWindows ? systemTray.popUpContextMenu() : appWindow.show();
      }
    });
  }

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

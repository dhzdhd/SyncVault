import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:system_tray/system_tray.dart';

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
      MenuItemLabel(
        label: 'Show app',
        onClicked: (menuItem) => appWindow.show(),
      )
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

  final settings = SettingsNotifier.init();
  if (settings.isSentryEnabled) {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://6f9773aae01846168e9cd2b1e62adde3@o4504764245344256.ingest.sentry.io/4505318015696896';
        options.tracesSampleRate = 1.0;
      },
      appRunner: () => runApp(
        ProviderScope(child: MyApp(settingsController: settingsController)),
      ),
    );
  } else {
    runApp(ProviderScope(child: MyApp(settingsController: settingsController)));
  }
}

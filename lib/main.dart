import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:syncvault/injectable.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';
import 'package:syncvault/src/introduction/models/intro_model.dart';
import 'package:syncvault/src/settings/models/settings_model.dart';
import 'package:system_tray/system_tray.dart';
import 'package:workmanager/workmanager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:syncvault/hive/hive_registrar.g.dart';

import 'src/app.dart';
import 'src/settings/controllers/settings_controller.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    await Hive.initFlutter();

    final authInfo = Auth.init();
    final folderInfo = Folder.init();

    for (final folderModel in folderInfo) {
      if (folderModel.isAutoSync) {
        final authModel = authInfo
            .where((element) => element.remoteName == folderModel.remoteName)
            .first;

        // final result = await RCloneDriveService()
        //     .upload(
        //       providerModel: authModel,
        //       folderModel: folderModel,
        //       localPath: '',
        //     )
        //     .run();

        // result.match(
        //   (l) => print(l.message),
        //   (r) => print('Success'),
        // );
      }
    }

    return Future.value(true);
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  GetIt.I.registerSingleton<Dio>(Dio());

  await dotenv.load();

  await Hive.initFlutter();
  await Hive.openBox('vault');
  Hive.registerAdapters();

  final docDir = await getApplicationDocumentsDirectory();
  final boxPath = '${docDir.path}/SyncVault/hive';

  final settingsBox =
      await Hive.openBox<SettingsModel>('settings_box', path: boxPath);
  GetIt.I.registerSingleton<Box<SettingsModel>>(settingsBox);

  final introSettingsBox = await Hive.openBox<IntroSettingsModel>(
    'intro_settings_box',
    path: boxPath,
  );
  GetIt.I.registerSingleton<Box<IntroSettingsModel>>(introSettingsBox);

  final accountsBox =
      await Hive.openBox<DriveProviderModel>('accounts_box', path: boxPath);
  GetIt.I.registerSingleton<Box<DriveProviderModel>>(accountsBox);

  final foldersBox =
      await Hive.openBox<FolderModel>('folders_box', path: boxPath);
  GetIt.I.registerSingleton<Box<FolderModel>>(foldersBox);

  final settings = Settings.init();

  if (Platform.isWindows) {
    final appWindow = AppWindow();
    final systemTray = SystemTray();

    await systemTray.initSystemTray(
      title: 'SyncVault',
      iconPath: 'assets/icons/icon.ico',
    );

    final menu = Menu();
    await menu.buildFrom([
      MenuItemLabel(label: 'Show', onClicked: (menuItem) => appWindow.show()),
      MenuItemLabel(label: 'Hide', onClicked: (menuItem) => appWindow.hide()),
      MenuItemLabel(label: 'Exit', onClicked: (menuItem) => appWindow.close())
    ]);

    await systemTray.setContextMenu(menu);
    systemTray.registerSystemTrayEventHandler((eventName) {
      if (eventName == kSystemTrayEventClick) {
        Platform.isWindows ? appWindow.show() : systemTray.popUpContextMenu();
      } else if (eventName == kSystemTrayEventRightClick) {
        Platform.isWindows ? systemTray.popUpContextMenu() : appWindow.show();
      }
    });

    if (settings.isHideOnStartup) {
      await appWindow.hide();
    }
  } else {
    Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
    Workmanager().registerPeriodicTask(
      'task-sync',
      'syncData',
      frequency: const Duration(minutes: 15), // Minimum possible duration :(
      initialDelay: const Duration(seconds: 5),
      existingWorkPolicy: ExistingWorkPolicy.replace,
    );
  }

  if (settings.isSentryEnabled) {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://6f9773aae01846168e9cd2b1e62adde3@o4504764245344256.ingest.sentry.io/4505318015696896';
        options.tracesSampleRate = 1.0;
      },
      appRunner: () => runApp(
        const ProviderScope(child: MyApp()),
      ),
    );
  } else {
    runApp(const ProviderScope(child: MyApp()));
  }
}

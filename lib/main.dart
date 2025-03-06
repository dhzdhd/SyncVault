import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:syncvault/helpers.dart';
import 'package:syncvault/injectable.dart';
import 'package:syncvault/setup.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/home/controllers/folder_controller.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';
import 'package:syncvault/src/home/services/rclone.dart';
import 'package:syncvault/src/introduction/models/intro_model.dart';
import 'package:syncvault/src/settings/models/settings_model.dart';
// import 'package:workmanager/workmanager.dart';
import 'package:syncvault/hive/hive_registrar.g.dart';
import 'package:window_manager/window_manager.dart';

import 'src/app.dart';
import 'src/settings/controllers/settings_controller.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  // Workmanager().executeTask((task, inputData) async {
  // final authInfo = Auth.init();
  // final folderInfo = Folder.init();

  // for (final folderModel in folderInfo) {
  //   if (folderModel.isAutoSync) {
  //     final authModel = authInfo
  //         .where((element) => element.remoteName == folderModel.remoteName)
  //         .first;

  //     // final result = await RCloneDriveService()
  //     //     .upload(
  //     //       providerModel: authModel,
  //     //       folderModel: folderModel,
  //     //       localPath: '',
  //     //     )
  //     //     .run();

  //     // result.match(
  //     //   (l) => print(l.message),
  //     //   (r) => print('Success'),
  //     // );
  //   }
  // }

  // return Future.value(true);
  // });
}

void backgroundTask(RootIsolateToken rootIsolateToken) async {
  BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);

  final authInfo = Auth.init();
  final folderInfo = Folder.init();
  final driveService = RCloneDriveService();

  for (final folderModel in folderInfo) {
    Directory(folderModel.folderPath).watch().listen((event) async {
      final providerModel = authInfo
          .filter((model) => model.remoteName == folderModel.remoteName)
          .first;

      switch (event.type) {
        case FileSystemEvent.create:
          {
            final result = await driveService
                .upload(
                  providerModel: providerModel,
                  folderModel: folderModel,
                  localPath: event.path,
                )
                .run();
            result.match(
              (e) => print(e),
              (t) {},
            );
          }
      }
    });
  }

  for (int i = 0; i < 10; i++) print('hi');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.I.registerSingleton<Dio>(Dio());

  // Hive stuff
  await Hive.initFlutter();
  Hive.registerAdapters();

  final docDir = await getApplicationDocumentsDirectory();
  final boxPath = '${docDir.path}/SyncVault/hive';

  await setupHiveBox<SettingsModel>(boxPath);
  await setupHiveBox<IntroSettingsModel>(boxPath);
  await setupHiveBox<DriveProviderModel>(boxPath);
  await setupHiveBox<FolderModel>(boxPath);

  final settings = Settings.init();

  configureDependencies();

  // if (PlatformExtension.isDesktop) {
  //   Isolate.spawn<RootIsolateToken>(backgroundTask, RootIsolateToken.instance!);
  // }

  if (PlatformExtension.isDesktop) {
    await windowManager.ensureInitialized();

    if (settings.isHideOnStartup) {
      await windowManager.hide();
    }
  } else if (Platform.isAndroid) {
    // Work manager
    // Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
    // Workmanager().registerPeriodicTask(
    //   'task-sync',
    //   'syncData',
    //   frequency: const Duration(minutes: 15), // Minimum possible duration :(
    //   initialDelay: const Duration(seconds: 5),
    //   existingWorkPolicy: ExistingWorkPolicy.replace,
    // );
  }

  if (settings.isSentryEnabled) {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://6f9773aae01846168e9cd2b1e62adde3@o4504764245344256.ingest.us.sentry.io/4505318015696896';
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

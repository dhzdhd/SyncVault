import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:launch_at_startup/launch_at_startup.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/home/models/folder_hash_model.dart';
import 'package:syncvault/src/home/services/file_comparer.dart';
import 'package:syncvault/helpers.dart';
import 'package:syncvault/injectable/injectable.dart';
import 'package:syncvault/log.dart';
import 'package:syncvault/setup.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/graph/models/workflow_model.dart';
import 'package:syncvault/src/home/controllers/folder_controller.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';
import 'package:syncvault/src/home/services/rclone.dart';
import 'package:syncvault/src/introduction/models/intro_model.dart';
import 'package:syncvault/src/settings/models/settings_model.dart';
import 'package:workmanager/workmanager.dart';
import 'package:syncvault/hive/hive_registrar.g.dart';
import 'package:window_manager/window_manager.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'src/app.dart';
import 'src/settings/controllers/settings_controller.dart';

const notifID = 2352;

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    // Setup and show notification
    final notifService = FlutterLocalNotificationsPlugin();
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: null,
    );
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'sync_notif',
      'SyncVault',
      channelDescription: 'Notifies user of app running in background',
      importance: Importance.low,
      priority: Priority.min,
      ticker: 'SyncVault sync running in background',
      actions: [
        AndroidNotificationAction('cancel_sync', 'Stop background sync')
      ],
    );
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    final notifs = await notifService.getActiveNotifications();
    final notif = notifs.filter((notif) => notif.id == notifID);

    if (notif.isEmpty) {
      await notifService.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: notificationHandler,
      );
      await notifService.show(
        notifID,
        'File sync',
        'Syncing files in the background',
        notificationDetails,
        payload: 'item x',
      );
    }

    await Hive.initFlutter();
    Hive.registerAdapters();

    // Setup Hive boxes for folder, hash and auth info
    final docDir = await getApplicationDocumentsDirectory();
    final service = RCloneDriveService();
    final boxPath = '${docDir.path}/SyncVault/hive';

    await setupHiveBox<DriveProviderModel>(boxPath);
    await setupHiveBox<FolderModel>(boxPath);
    await setupHiveBox<FolderHashModel>(boxPath);

    final authProviders = Auth.init();
    final folders = Folder.init().filter((folder) => folder.isAutoSync);
    final hashes = GetIt.I<Box<FolderHashModel>>().values;

    final fileComparer = FileComparer();

    // File watcher approach does not work on mobile devices
    for (final folderModel in folders) {
      final entities = await Directory(folderModel.folderPath)
          .list(recursive: true)
          .toList();
      final files = entities.whereType<File>().toList();

      debugLogger.i(files);

      // Compare calculated and stored hash
      final calcHashResult = await fileComparer.calcHash(files).run();
      final storedHashResult = hashes
          .filter((model) => model.remoteName == folderModel.remoteName)
          .firstOption
          .toEither(() => const GeneralError('Stored hash does not exist'));

      final Either<AppError, bool> hashCompareResult = Either.Do(($) {
        final calcHash = $(calcHashResult);
        final storedHash = $(storedHashResult).hash;

        return fileComparer.isSameFolder(calcHash, storedHash);
      });

      // If equal, sync files
      hashCompareResult.match(
        (err) {
          debugLogger.e(err);
        },
        (val) async {
          final providerModel = authProviders
              .filter(
                  (provider) => provider.remoteName == folderModel.remoteName)
              .firstOption;

          await service
              .upload(
                  providerModel: providerModel.toNullable()!,
                  folderModel: folderModel,
                  localPath: folderModel.folderPath)
              .run();
        },
      );
    }

    return Future.value(true);
  });
}

@pragma('vm:entry-point')
void notificationHandler(NotificationResponse notificationResponse) async {
  if (notificationResponse.actionId == 'cancel_sync') {
    final notifService = FlutterLocalNotificationsPlugin();
    await notifService.cancel(notifID);
    await Workmanager().cancelAll();
  }
}

// TODO: Setup desktop bg sync task
// void backgroundTask(RootIsolateToken rootIsolateToken) async {
//   BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);

//   final authInfo = Auth.init();
//   final folderInfo = Folder.init();
//   final driveService = RCloneDriveService();

//   for (final folderModel in folderInfo) {
//     Directory(folderModel.folderPath).watch().listen((event) async {
//       final providerModel = authInfo
//           .filter((model) => model.remoteName == folderModel.remoteName)
//           .first;

//       switch (event.type) {
//         case FileSystemEvent.create:
//           {
//             final result = await driveService
//                 .upload(
//                   providerModel: providerModel,
//                   folderModel: folderModel,
//                   localPath: event.path,
//                 )
//                 .run();
//             result.match(
//               (e) => print(e),
//               (t) {},
//             );
//           }
//       }
//     });
//   }

//   for (int i = 0; i < 10; i++) print('hi');
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hive stuff
  await Hive.initFlutter();
  Hive.registerAdapters();

  final docDir = await getApplicationDocumentsDirectory();
  final boxPath = '${docDir.path}/SyncVault/hive';

  await setupHiveBox<SettingsModel>(boxPath);
  await setupHiveBox<IntroSettingsModel>(boxPath);
  await setupHiveBox<DriveProviderModel>(boxPath);
  await setupHiveBox<FolderModel>(boxPath);
  await setupHiveBox<WorkflowModel>(boxPath);
  if (PlatformExtension.isMobile) {
    await setupHiveBox<FolderHashModel>(boxPath);
  }

  configureDependencies();

  final settings = Settings.init();

  // if (PlatformExtension.isDesktop) {
  //   Isolate.spawn<RootIsolateToken>(backgroundTask, RootIsolateToken.instance!);
  // }

  if (PlatformExtension.isDesktop) {
    await windowManager.ensureInitialized();

    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    launchAtStartup.setup(
      appName: packageInfo.appName,
      appPath: Platform.resolvedExecutable,
      packageName: 'com.example.syncvault',
    );

    if (settings.isLaunchOnStartup) {
      await launchAtStartup.enable();
    } else {
      await launchAtStartup.disable();
    }

    if (settings.isHideOnStartup) {
      await windowManager.hide();
    }
  } else if (Platform.isAndroid) {
    Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
    Workmanager().registerPeriodicTask(
      'sync',
      'syncData',
      frequency: const Duration(minutes: 15), // Minimum possible duration :(
      initialDelay: const Duration(seconds: 5),
      existingWorkPolicy: ExistingWorkPolicy.replace,
      constraints: Constraints(networkType: NetworkType.connected),
    );
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

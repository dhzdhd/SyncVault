import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:launch_at_startup/launch_at_startup.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/common/services/hive_storage.dart';
import 'package:syncvault/src/common/services/rclone.dart';
import 'package:syncvault/src/common/utils/associations.dart';
import 'package:syncvault/src/home/controllers/connection_controller.dart';
import 'package:syncvault/src/home/models/folder_hash_model.dart';
import 'package:syncvault/extensions.dart';
import 'package:syncvault/injectable/injectable.dart';
import 'package:syncvault/log.dart';
import 'package:syncvault/setup.dart';
import 'package:syncvault/src/home/services/file_comparer.dart';
import 'package:syncvault/src/home/services/rclone.dart';
import 'package:syncvault/src/workflows/models/workflow_model.dart';
import 'package:syncvault/src/home/models/connection_model.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';
import 'package:syncvault/src/introduction/models/intro_model.dart';
import 'package:syncvault/src/settings/models/settings_model.dart';
import 'package:workmanager/workmanager.dart';
import 'package:syncvault/hive/hive_registrar.g.dart';
import 'package:window_manager/window_manager.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'src/app.dart';
import 'src/settings/controllers/settings_controller.dart';

const notifID = 2352;

Future<void> _showBackgroundNotification() async {
  final notifService = FlutterLocalNotificationsPlugin();
  const InitializationSettings initializationSettings = InitializationSettings(
    android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    iOS: null,
  );
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
        'sync_notif',
        'SyncVault',
        channelDescription: 'Notifies user of app running in background',
        importance: Importance.min,
        priority: Priority.min,
        silent: true,
        ticker: 'SyncVault sync running in background',
        actions: [
          AndroidNotificationAction('cancel_sync', 'Stop background sync'),
        ],
      );
  const NotificationDetails notificationDetails = NotificationDetails(
    android: androidNotificationDetails,
  );

  await notifService.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: notificationHandler,
  );
  await notifService.show(
    notifID,
    'File sync',
    'Syncing files in the background',
    notificationDetails,
  );
}

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    final execPath = inputData?['execPath'] as String?;

    if (execPath == null) {
      return Future.value(false);
    }

    await Hive.initFlutter();
    Hive.registerAdapters();

    // Setup Hive boxes for folder, hash and auth info
    final docDir = await getApplicationDocumentsDirectory();
    final boxPath = '${docDir.path}/SyncVault/hive';

    await setupHiveBox<SettingsModel>(boxPath);
    await setupHiveBox<IntroSettingsModel>(boxPath);
    await setupHiveBox<RemoteProviderModel>(boxPath);
    await setupHiveBox<DriveProviderModel>(boxPath);
    await setupHiveBox<ConnectionModel>(boxPath);
    await setupHiveBox<FolderModel>(boxPath);
    await setupHiveBox<WorkflowModel>(boxPath);

    final hashBox = await setupHiveBox<FolderHashModel>(boxPath);
    final hashStorage = HiveStorage<FolderHashModel>(hashBox);

    configureDependencies();

    final connections = Connection.init().filter((conn) => conn.isAutoSync);
    final folders = Folder.init();
    final providers = await Auth.init();
    final hashes = hashBox.values;

    final fileComparer = FileComparer();

    // File watcher approach does not work on mobile devices
    for (final connection in connections) {
      final (firstFolderOpt, secondFolderOpt) = getFoldersFromConnection(
        connection,
        folders,
      );

      if (firstFolderOpt.isNone() || secondFolderOpt.isNone()) {
        debugLogger.i('First or second folder is none');
        continue;
      }

      final firstFolder = firstFolderOpt.toNullable()!;
      final secondFolder = secondFolderOpt.toNullable()!;

      final Option<LocalFolderModel> localFolder = switch ((
        firstFolder,
        secondFolder,
      )) {
        (final x, _) when x is LocalFolderModel => Some(x),
        (_, final y) when y is LocalFolderModel => Some(y),
        _ => None(),
      };

      final firstProvider = getProviderFromFolder(
        providers,
        firstFolder,
      ).toNullable();
      final secondProvider = getProviderFromFolder(
        providers,
        secondFolder,
      ).toNullable();

      if (firstProvider == null || secondProvider == null) {
        debugLogger.e('One/Both providers are null');
        continue;
      }

      await localFolder.match(
        () {
          debugLogger.e('Local folder does not exist');
        },
        (localFolder) async {
          late final List<File> files;

          try {
            final entities = await Directory(
              localFolder.folderPath,
            ).list(recursive: true).toList();
            files = entities.whereType<File>().toList();
          } catch (err) {
            debugLogger.e('Failed to fetch local files', error: err);
          }

          debugLogger.i(files);

          // Compare calculated and stored hash
          final calcHashResult = await fileComparer.calcHash(files).run();
          final storedHashResult = hashes
              .filter((hash) => hash.id == localFolder.id)
              .firstOption
              .toEither(
                () => const GeneralError(
                  'Stored hash does not exist',
                  null,
                  null,
                ),
              );

          final Either<AppError, bool> hashCompareResult = Either.Do(($) {
            final calcHash = $(calcHashResult);
            return storedHashResult.match(
              (err) {
                return false;
              },
              (storedHash) {
                return fileComparer.isSameFolder(calcHash, storedHash.hash);
              },
            );
          });

          // If not equal, sync files
          await hashCompareResult.match(
            (err) {
              GeneralError(
                'Error in comparing hashes',
                err,
                err.stackTrace,
              ).logError();
            },
            (isSameFolder) async {
              debugLogger.i(isSameFolder);

              final syncService = RCloneSyncService();
              syncService.setRClonePath(execPath);

              final result = await syncService
                  .sync_(
                    connectionModel: connection,
                    firstFolder: firstFolder,
                    firstProvider: firstProvider,
                    secondFolder: secondFolder,
                    secondProvider: secondProvider,
                  )
                  .toList();
              final hasFailed = result.any((item) => item.isLeft());

              if (hasFailed) {
                for (final item in result) {
                  item.match((l) => l.logError(), (r) => ());
                }
              } else {
                debugLogger.i('Background sync completed');

                final files = await Directory(
                  localFolder.folderPath,
                ).list(recursive: true).toList();
                final hashResult = await fileComparer
                    .calcHash(files.whereType<File>().toList())
                    .run();
                hashResult.match(
                  (err) =>
                      GeneralError(err.message, err, err.stackTrace).logError(),
                  (hash) async {
                    final hashModels = hashStorage.fetchAll().toList();
                    final model = FolderHashModel(
                      hash: hash,
                      id: localFolder.id,
                    );
                    await hashStorage.update(
                      hashModels
                        ..removeWhere((hash) => hash.id == localFolder.id)
                        ..add(model),
                    );
                  },
                );
              }
            },
          );
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

    debugLogger.i('Cancelled all background tasks');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hive stuff
  await Hive.initFlutter();
  Hive.registerAdapters();

  final docDir = await getApplicationDocumentsDirectory();
  final boxPath = '${docDir.path}/SyncVault/hive';

  await setupHiveBox<SettingsModel>(boxPath);
  await setupHiveBox<IntroSettingsModel>(boxPath);
  await setupHiveBox<RemoteProviderModel>(boxPath);
  await setupHiveBox<ConnectionModel>(boxPath);
  await setupHiveBox<FolderModel>(boxPath);
  await setupHiveBox<WorkflowModel>(boxPath);
  await setupHiveBox<FolderHashModel>(boxPath);

  configureDependencies();

  final settings = await Settings.init();

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
    await _showBackgroundNotification();
    final execPath = await RCloneUtils().getRCloneExec().run();

    Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
    Workmanager().registerPeriodicTask(
      'sync',
      'syncData',
      frequency: const Duration(minutes: 15), // Minimum possible duration :(
      initialDelay: const Duration(seconds: 15),
      existingWorkPolicy: ExistingWorkPolicy.replace,
      constraints: Constraints(networkType: NetworkType.connected),
      inputData: {'execPath': execPath.toNullable()},
    );
  }

  if (settings.isSentryEnabled) {
    await SentryFlutter.init((options) {
      options.dsn =
          'https://6f9773aae01846168e9cd2b1e62adde3@o4504764245344256.ingest.us.sentry.io/4505318015696896';
      options.tracesSampleRate = 1.0;
    }, appRunner: () => runApp(const ProviderScope(child: MyApp())));
  } else {
    runApp(const ProviderScope(child: MyApp()));
  }
}

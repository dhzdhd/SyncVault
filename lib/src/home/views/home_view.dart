import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/log.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/common/components/sliver_animated_app_bar.dart';
import 'package:syncvault/src/common/utils/associations.dart';
import 'package:syncvault/src/home/components/connection_card_widget.dart';
import 'package:syncvault/src/home/controllers/connection_controller.dart';
import 'package:syncvault/src/workflows/views/workflow_view.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';
import 'package:syncvault/src/accounts/views/account_view.dart';
import 'package:syncvault/extensions.dart';
import 'package:syncvault/src/home/components/new_connection_dialog_widget.dart';
import 'package:watcher/watcher.dart';
import 'package:syncvault/src/settings/views/settings_view.dart';
import 'package:window_manager/window_manager.dart';

class HomeView extends StatefulHookConsumerWidget {
  const HomeView({super.key});

  static const routeName = '/home';

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final Map<String, DirectoryWatcher> _connWatcherMap = {};
  late final FlutterLocalNotificationsPlugin notifService;

  @override
  void initState() {
    final connections = ref.read(connectionProvider);
    final folders = ref.read(folderProvider);

    for (final conn in connections) {
      final (firstFolderOpt, secondFolderOpt) = getFoldersFromConnection(
        conn,
        folders,
      );

      final localFolder = Option<LocalFolderModel>.Do(($) {
        final firstFolder = $(firstFolderOpt);
        final secondFolder = $(secondFolderOpt);

        return $(switch ((firstFolder, secondFolder)) {
          (final x, _) when x is LocalFolderModel => Some(x),
          (_, final y) when y is LocalFolderModel => Some(y),
          _ => None(),
        });
      });

      localFolder.match(() {}, (val) {
        _connWatcherMap[conn.id] = DirectoryWatcher(val.folderPath);
      });
    }

    notifService = FlutterLocalNotificationsPlugin();
    () async {
      final DarwinInitializationSettings initializationSettingsDarwin =
          DarwinInitializationSettings();
      final LinuxInitializationSettings initializationSettingsLinux =
          LinuxInitializationSettings(defaultActionName: 'Sync notification');
      final WindowsInitializationSettings initializationSettingsWindows =
          WindowsInitializationSettings(
            appName: 'SyncVault',
            appUserModelId: 'Dev.Dhzdhd.SyncVault',
            guid: 'd49b0214-ef7a-4526-bb79-97cdb8a991bb',
          );

      final initializationSettings = InitializationSettings(
        macOS: initializationSettingsDarwin,
        windows: initializationSettingsWindows,
        linux: initializationSettingsLinux,
      );

      await notifService.initialize(initializationSettings);
    }();

    super.initState();
  }

  @override
  void dispose() {
    for (DirectoryWatcher i in _connWatcherMap.values) {
      i.events.drain();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      final connections = ref.watch(connectionProvider);
      final folderIds = ref.watch(folderProvider).map((folder) => folder.id);

      () async {
        for (final entry in _connWatcherMap.entries) {
          final watcher = entry.value;
          final connectionId = entry.key;
          final connection = connections
              .filter((conn) => conn.id == connectionId)
              .firstOrNull;

          if (connection == null ||
              !folderIds.contains(connection.firstFolderId) ||
              !folderIds.contains(connection.secondFolderId)) {
            continue;
          }

          watcher.events.listen((event) async {
            switch (event.type) {
              case ChangeType.ADD || ChangeType.MODIFY
                  when connection.isAutoSync:
                {
                  debugLogger.i(event.toString());

                  try {
                    await notifService.show(
                      23325,
                      'Currently syncing ${connection.title}',
                      'In progress',
                      null,
                    );

                    await ref
                        .read(connectionProvider.notifier)
                        .uniSync(connection);
                    debugLogger.i('Successfully uploaded for ADD | MODIFY');
                  } catch (e, st) {
                    await notifService.show(
                      23326,
                      'Sync failed for ${connection.title}',
                      null,
                      null,
                    );
                    GeneralError('', e, st).logError();
                  } finally {
                    await notifService.cancel(23325);
                    await notifService.cancel(23326);
                  }
                }
              case ChangeType.REMOVE
                  when connection.isDeletionEnabled && connection.isAutoSync:
                {
                  debugLogger.i(event.toString());

                  try {
                    await ref
                        .read(connectionProvider.notifier)
                        .uniSync(connection);
                    debugLogger.i('Successfully uploaded for DELETE');
                  } catch (e, st) {
                    // TODO:
                    GeneralError('', e, st).logError();
                  }
                }
            }
          });
        }
      }();

      return () => {
        for (DirectoryWatcher i in _connWatcherMap.values) {i.events.drain()},
      };
    }, [ref.watch(folderProvider)]);

    final folders = ref.watch(folderProvider);
    final connections = ref.watch(connectionProvider);

    ref.listen<AsyncValue>(syncControllerProvider, (prev, state) {
      if (!state.isLoading && state.hasError) {
        context.showErrorSnackBar(
          GeneralError('Upload failed', state.error!, state.stackTrace).message,
        );
      }
    });

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'Create new connection',
        onPressed: () async {
          if (folders.length < 2) {
            context.showErrorSnackBar(
              'Atleast two folders need to be created in separate remotes',
            );
            return;
          }

          if (context.mounted) {
            await showDialog(
              context: context,
              builder: (context) => const NewConnectionDialogWidget(),
            );
          }
        },
        child: const Icon(Icons.add),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAnimatedAppBar(
            title: 'Home',
            canExpand: connections.isNotEmpty,
            hasLeading: false,
            actions: [
              if (PlatformExtension.isDesktop)
                IconButton(
                  icon: const Icon(Icons.arrow_downward),
                  tooltip: 'Hide to system tray',
                  onPressed: () async {
                    await windowManager.hide();
                  },
                ),
              IconButton(
                icon: const Icon(Icons.hub_outlined),
                tooltip: 'Navigate to workflows',
                onPressed: () {
                  Navigator.restorablePushNamed(
                    context,
                    WorkflowsView.routeName,
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.account_circle),
                tooltip: 'Navigate to accounts',
                onPressed: () {
                  Navigator.restorablePushNamed(context, AccountView.routeName);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  icon: const Icon(Icons.settings),
                  tooltip: 'Navigate to settings',
                  onPressed: () {
                    Navigator.restorablePushNamed(
                      context,
                      SettingsView.routeName,
                    );
                  },
                ),
              ),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 16,
              right: 16,
              bottom: 84,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed(
                connections
                    .mapWithIndex(
                      (connection, index) =>
                          ConnectionCardWidget(connectionModel: connection),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/log.dart';
import 'package:syncvault/src/common/components/sliver_animated_app_bar.dart';
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
  late final List<DirectoryWatcher> _watchers;

  @override
  void initState() {
    // final connections = ref.read(folderProvider).toList();
    _watchers = [];
    // _watchers = folders.map((e) => DirectoryWatcher(e.folderPath)).toList();
    super.initState();
  }

  @override
  void dispose() {
    for (DirectoryWatcher i in _watchers) {
      i.events.drain();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      // final folders = ref.watch(folderProvider).toList();
      final folders = [];

      for (int i = 0; i < _watchers.length; i++) {
        // TODO: Match watcher and folder by remote name instead of index
        // Also add/delete watcher with folder
        _watchers[i].events.listen((event) async {
          debugLogger.i(event.toString());
          switch (event.type) {
            case ChangeType.ADD || ChangeType.MODIFY when folders[i].isAutoSync:
              {
                try {
                  // await ref
                  //     .read(folderProvider.notifier)
                  //     .upload(folders[i], some(event.path));
                  debugPrint('Success');
                } catch (e, _) {
                  // TODO:
                  // ProviderError(
                  //   folders[i].provider,
                  //   ProviderOperationType.upload,
                  //   e,
                  //   st,
                  // ).logError();
                }
              }
            case ChangeType.REMOVE
                when folders[i].isDeletionEnabled && folders[i].isAutoSync:
              {
                // final result = await ref
                //     .read(folderProvider.notifier)
                //     .delete(folders[i], some(event.path))
                //     .run();

                // result.match(
                //     (l) => debugPrint(l.message), (r) => debugPrint('Success'));
              }
          }
        });
      }

      return () => {
        for (final i in _watchers) {i.events.drain()},
      };
    }, [ref.watch(folderProvider)]);

    final folderInfo = [];
    final folders = ref.watch(folderProvider);
    final uploadDeleteController = ref.watch(uploadDeleteControllerProvider);

    final connections = ref.watch(connectionProvider);

    ref.listen<AsyncValue>(uploadDeleteControllerProvider, (prev, state) {
      if (!state.isLoading && state.hasError) {
        context.showErrorSnackBar(
          GeneralError('Upload failed', state.error!, state.stackTrace).message,
        );
      }
    });

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'Sync new folder',
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
            canExpand: folderInfo.isNotEmpty,
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
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed(
                connections
                    .mapWithIndex(
                      (connection, index) => ConnectionCardWidget(
                        uploadDeleteController: uploadDeleteController,
                        connectionModel: connection,
                      ),
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

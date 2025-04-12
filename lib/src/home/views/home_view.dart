import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/log.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/common/components/sliver_animated_app_bar.dart';
import 'package:syncvault/src/graph/views/workflow_view.dart';
import 'package:syncvault/src/home/controllers/folder_controller.dart';
import 'package:syncvault/src/accounts/views/account_view.dart';
import 'package:syncvault/helpers.dart';
import 'package:syncvault/src/common/components/circular_progress_widget.dart';
import 'package:syncvault/src/home/components/delete_folder_dialog.dart';
import 'package:syncvault/src/home/components/expandable_card_widget.dart';
import 'package:syncvault/src/home/components/new_folder_dialog_widget.dart';
import 'package:syncvault/src/home/components/tree_view_sheet_widget.dart';
import 'package:url_launcher/url_launcher.dart';
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
    final folders = ref.read(folderProvider).toList();
    _watchers = folders.map((e) => DirectoryWatcher(e.folderPath)).toList();
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
      final folders = ref.watch(folderProvider).toList();

      for (int i = 0; i < _watchers.length; i++) {
        // TODO: Match watcher and folder by remote name instead of index
        // Also add/delete watcher with folder
        _watchers[i].events.listen((event) async {
          debugLogger.i(event.toString());
          switch (event.type) {
            case ChangeType.ADD || ChangeType.MODIFY when folders[i].isAutoSync:
              {
                try {
                  await ref
                      .read(folderProvider.notifier)
                      .upload(folders[i], some(event.path));
                  debugPrint('Success');
                } catch (e, st) {
                  debugPrint(
                    e.handleError('Failed to sync folders', st).message,
                  );
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

    final folderInfo = ref.watch(folderProvider);
    final folderNotifier = ref.read(folderProvider.notifier);
    final uploadDeleteController = ref.watch(uploadDeleteControllerProvider);
    final currentLoadingIndex = useState(0);

    ref.listen<AsyncValue>(uploadDeleteControllerProvider, (prev, state) {
      if (!state.isLoading && state.hasError) {
        context.showErrorSnackBar(
          state.error!
              .handleError(
                'Upload/Delete controller failed',
                state.stackTrace ?? StackTrace.empty,
              )
              .message,
        );
      }
    });

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'Sync new folder',
        onPressed: () async {
          if (ref.watch(authProvider).isEmpty) {
            context.showErrorSnackBar('No accounts registered yet');
            return;
          }

          if (context.mounted) {
            await showDialog(
              context: context,
              builder: (context) => const NewFolderDialogWidget(),
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
                folderInfo
                    .mapWithIndex(
                      (e, index) => ExpandableCardWidget(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Tooltip(
                              message: e.provider.displayName,
                              child: SvgPicture.asset(
                                e.provider.providerIcon,
                                width: 25,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                e.folderName,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                          ],
                        ),
                        trailing: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Visibility(
                            visible:
                                uploadDeleteController.isLoading &&
                                currentLoadingIndex.value == index,
                            child: const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressWidget(
                                size: 300,
                                isInfinite: true,
                              ),
                            ),
                          ),
                        ),
                        child: Column(
                          spacing: 8.0,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).dialogBackgroundColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        e.folderPath,
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.bodyLarge,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          if (PlatformExtension.isDesktop)
                                            Flexible(
                                              child: SizedBox(
                                                width: 50,
                                                child: Tooltip(
                                                  message:
                                                      'Open in file manager',
                                                  child: TextButton(
                                                    child: const Icon(
                                                      Icons.open_in_new,
                                                    ),
                                                    onPressed: () async {
                                                      await launchUrl(
                                                        Uri.file(e.folderPath),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          Flexible(
                                            child: SizedBox(
                                              width: 50,
                                              child: Tooltip(
                                                message: 'Sync',
                                                child: TextButton(
                                                  child: const Icon(Icons.sync),
                                                  onPressed: () async {
                                                    if (uploadDeleteController
                                                        .isLoading) {
                                                      return;
                                                    }
                                                    currentLoadingIndex.value =
                                                        index;

                                                    if (!uploadDeleteController
                                                        .isLoading) {
                                                      await ref
                                                          .read(
                                                            uploadDeleteControllerProvider
                                                                .notifier,
                                                          )
                                                          .upload(e, none());

                                                      if (context.mounted) {
                                                        context
                                                            .showSuccessSnackBar(
                                                              content:
                                                                  'Success',
                                                            );
                                                      }
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: SizedBox(
                                              width: 50,
                                              child: Tooltip(
                                                message: 'Delete',
                                                child: TextButton(
                                                  child: const Icon(
                                                    Icons.delete,
                                                  ),
                                                  onPressed: () async {
                                                    if (uploadDeleteController
                                                        .isLoading) {
                                                      return;
                                                    }
                                                    // TODO: Perhaps make loadingIndex an array
                                                    currentLoadingIndex.value =
                                                        index;

                                                    if (context.mounted) {
                                                      if (context.mounted) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (ctx) =>
                                                                  DeleteFolderDialogWidget(
                                                                    model: e,
                                                                  ),
                                                        );
                                                      }
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Account',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                Text(
                                  e.remoteName,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Auto sync',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                SizedBox(
                                  height: 30,
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Switch(
                                      value: e.isAutoSync,
                                      onChanged:
                                          (val) =>
                                              folderNotifier.toggleAutoSync(e),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Bidirectional sync',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                SizedBox(
                                  height: 30,
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Switch(
                                      value: e.isTwoWaySync,
                                      onChanged:
                                          (val) => folderNotifier
                                              .toggleTwoWaySync(e),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Delete on sync',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                SizedBox(
                                  height: 30,
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Switch(
                                      value: e.isDeletionEnabled,
                                      onChanged:
                                          (val) => folderNotifier
                                              .toggleDeletionOnSync(e),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () async {
                                  showModalBottomSheet(
                                    context: context,
                                    builder:
                                        (ctx) =>
                                            TreeViewSheetWidget(folderModel: e),
                                  );
                                },
                                child: const Text('Tree view'),
                              ),
                            ),
                          ],
                        ),
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

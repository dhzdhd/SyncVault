import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';
import 'package:syncvault/src/accounts/views/account_view.dart';
import 'package:syncvault/helpers.dart';
import 'package:syncvault/src/home/components/expandable_card_widget.dart';
import 'package:syncvault/src/home/components/new_folder_dialog_widget.dart';
import 'package:syncvault/src/home/components/tree_widget.dart';
import 'package:syncvault/src/home/services/rclone.dart';
import 'package:system_tray/system_tray.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:watcher/watcher.dart';

import '../../settings/views/settings_view.dart';

class HomeView extends StatefulHookConsumerWidget {
  const HomeView({
    super.key,
  });

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
        _watchers[i].events.listen((event) async {
          debugPrint(event.toString());
          switch (event.type) {
            case ChangeType.ADD || ChangeType.MODIFY when folders[i].isAutoSync:
              {
                try {
                  await ref.read(folderProvider.notifier).upload(
                        folders[i],
                        some(event.path),
                      );
                  debugPrint('Success');
                } catch (e) {
                  debugPrint(e.segregateError().message);
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

      return null;
    }, [ref.watch(folderProvider)]);

    final folderInfo = ref.watch(folderProvider);
    final folderNotifier = ref.read(folderProvider.notifier);
    final uploadDeleteController = ref.watch(uploadDeleteControllerProvider);
    final currentLoadingIndex = useState(0);

    ref.listen<AsyncValue>(
      uploadDeleteControllerProvider,
      (prev, state) {
        if (!state.isLoading && state.hasError) {
          context.showErrorSnackBar(state.error!.segregateError().message);
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('SyncVault'),
        actions: [
          IconButton(
            icon: const Icon(Icons.warning),
            tooltip: 'Test RClone',
            onPressed: () async {
              // final res = await RCloneAuthService()
              //     .authorize(
              //       remoteName: 'somethin',
              //       driveProvider: DriveProvider.googleDrive,
              //     )
              //     .run();
              final res = await RCloneUtils().getConfig().run();
              print(res);
            },
          ),
          if (Platform.isWindows)
            IconButton(
              icon: const Icon(Icons.arrow_downward),
              tooltip: 'Hide to system tray',
              onPressed: () async {
                await AppWindow().hide();
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
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
            ),
          ),
        ],
      ),
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
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: folderInfo
              .mapWithIndex(
                (e, index) => ExpandableCardWidget(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Tooltip(
                        message: e.provider.name.capitalize(),
                        child: SvgPicture.asset(
                          switch (e.provider) {
                            AuthProviderType.oneDrive =>
                              'assets/logos/onedrive.svg',
                            AuthProviderType.dropBox =>
                              'assets/logos/dropbox.svg',
                            AuthProviderType.googleDrive =>
                              'assets/logos/gdrive.svg'
                          },
                          width: 25,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          e.folderName,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ],
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Visibility(
                      visible: uploadDeleteController.isLoading &&
                          currentLoadingIndex.value == index,
                      child: const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).dialogBackgroundColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  e.folderPath,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    if (Platform.isWindows)
                                      Flexible(
                                        child: SizedBox(
                                          width: 50,
                                          child: Tooltip(
                                            message: 'Open in file manager',
                                            child: TextButton(
                                              child:
                                                  const Icon(Icons.open_in_new),
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
                                              currentLoadingIndex.value = index;

                                              if (!uploadDeleteController
                                                  .isLoading) {
                                                await ref
                                                    .read(
                                                      uploadDeleteControllerProvider
                                                          .notifier,
                                                    )
                                                    .upload(e, none());

                                                if (context.mounted) {
                                                  context.showSuccessSnackBar(
                                                    content: 'Success',
                                                    action: none(),
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
                                            child: const Icon(Icons.delete),
                                            onPressed: () async {
                                              // final result =
                                              //     await folderNotifier
                                              //         .delete(e, none())
                                              //         .run();

                                              // print(result);

                                              // if (context.mounted) {
                                              //   result.match(
                                              //     (l) =>
                                              //         context.showErrorSnackBar(
                                              //       l.message,
                                              //     ),
                                              //     (r) {
                                              //       context.showSuccessSnackBar(
                                              //         content: 'Deleted folder',
                                              //         action: none(),
                                              //       );
                                              //     },
                                              //   );
                                              // }
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
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Account',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              e.email,
                              style: Theme.of(context).textTheme.bodyLarge,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
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
                                  onChanged: (val) =>
                                      folderNotifier.toggleAutoSync(e),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Two way sync',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            SizedBox(
                              height: 30,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Switch(
                                  value: e.isTwoWaySync,
                                  onChanged: (val) =>
                                      folderNotifier.toggleTwoWaySync(e),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
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
                                  onChanged: (val) =>
                                      folderNotifier.toggleDeletionOnSync(e),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Visibility(
                        visible: e.files.isNotEmpty,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: ConstrainedBox(
                            constraints:
                                const BoxConstraints(minWidth: double.infinity),
                            child: Text(
                              'Tree View',
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: e.files.isNotEmpty,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 150.0),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Ink(
                              padding: const EdgeInsets.only(
                                  left: 16.0, right: 16.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).dialogBackgroundColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TreeWidget(files: e.files),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

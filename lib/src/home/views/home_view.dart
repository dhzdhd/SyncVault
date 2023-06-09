import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';
import 'package:syncvault/src/accounts/views/account_view.dart';
import 'package:syncvault/helpers.dart';
import 'package:syncvault/src/home/components/expandable_card_widget.dart';
import 'package:syncvault/src/home/components/new_folder_dialog_widget.dart';
import 'package:system_tray/system_tray.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:watcher/watcher.dart';

import '../../settings/views/settings_view.dart';

class HomeView extends StatefulHookConsumerWidget {
  const HomeView({
    super.key,
  });

  static const routeName = '/';

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
                final result = await ref.read(folderProvider.notifier).upload(
                      folders[i],
                      some(event.path),
                    );

                result.match(
                    (l) => debugPrint(l.message), (r) => debugPrint(r));
              }
            case ChangeType.REMOVE when folders[i].isDeletionEnabled:
              {
                ref.read(folderProvider.notifier).delete(folders[i]);
              }
          }
        });
      }

      return null;
    }, [ref.watch(folderProvider)]);

    final folderInfo = ref.watch(folderProvider);
    final progressVisibleList = useState(List.generate(
      folderInfo.length,
      (index) => false,
      growable: true,
    ));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sync Vault'),
        actions: [
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
          if (ref.read(authProvider).isEmpty) {
            context.showErrorSnackBar('No accounts registered yet');
            return;
          }

          progressVisibleList.value = [...progressVisibleList.value, false];
          await showDialog(
            context: context,
            builder: (context) => const NewFolderDialogWidget(),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: folderInfo
              .mapWithIndex(
                (e, index) => ExpandableCardWidget(
                  title: e.folderName.capitalize(),
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Visibility(
                      visible: progressVisibleList.value[index],
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
                                    Flexible(
                                      child: SizedBox(
                                        width: 50,
                                        child: TextButton(
                                          child: const Icon(Icons.sync_rounded),
                                          onPressed: () async {
                                            progressVisibleList.value = [
                                              ...progressVisibleList.value
                                                ..removeAt(index)
                                                ..insert(index, true)
                                            ];
                                            final result = await ref
                                                .read(folderProvider.notifier)
                                                .upload(e, none());
                                            progressVisibleList.value = [
                                              ...progressVisibleList.value
                                                ..removeAt(index)
                                                ..insert(index, false)
                                            ];

                                            if (context.mounted) {
                                              result.match(
                                                (l) =>
                                                    context.showErrorSnackBar(
                                                        l.message),
                                                (r) =>
                                                    context.showSuccessSnackBar(
                                                  content: r,
                                                  action: none(),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: SizedBox(
                                        width: 50,
                                        child: TextButton(
                                          child: const Icon(Icons.delete),
                                          onPressed: () {
                                            progressVisibleList.value = [
                                              ...progressVisibleList.value
                                                ..removeAt(
                                                  folderInfo.indexOf(e),
                                                )
                                            ];

                                            ref
                                                .watch(folderProvider.notifier)
                                                .delete(e);
                                            context.showSuccessSnackBar(
                                              content: 'Deleted folder',
                                              action: none(),
                                            );
                                          },
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
                              'Auto sync',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            // Spacer(),
                            SizedBox(
                              // width: 10,
                              height: 30,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Switch(
                                  value: e.isAutoSync,
                                  onChanged: (val) {
                                    ref
                                        .watch(folderProvider.notifier)
                                        .toggleAutoSync(e);
                                  },
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
                            // Spacer(),
                            SizedBox(
                              // width: 10,
                              height: 30,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Switch(
                                  value: e.isDeletionEnabled,
                                  onChanged: (val) => {
                                    ref
                                        .watch(folderProvider.notifier)
                                        .toggleDeletionOnSync(e)
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
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

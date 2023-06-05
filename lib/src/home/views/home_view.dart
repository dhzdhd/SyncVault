import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';
import 'package:syncvault/src/accounts/views/account_view.dart';
import 'package:syncvault/helpers.dart';
import 'package:syncvault/src/home/components/expandable_card_widget.dart';
import 'package:syncvault/src/home/components/new_folder_dialog_widget.dart';
import 'package:system_tray/system_tray.dart';
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
    super.initState();
    _watchers = ref
        .read(folderProvider)
        .map((e) => DirectoryWatcher(e.folderPath))
        .toList();
    for (final i in _watchers) {
      i.events.listen((event) {
        print(event);
      });
    }
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
          await showDialog(
            context: context,
            builder: (context) => const NewFolderDialogWidget(),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: ListView(padding: const EdgeInsets.all(16), children: [
          ...folderInfo
              .mapWithIndex(
                (e, index) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.folderName.capitalize(),
                              style: const TextStyle(fontSize: 25),
                            ),
                            Text(
                              e.folderPath,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Visibility(
                            visible: progressVisibleList.value[index],
                            child: const CircularProgressIndicator(
                              backgroundColor: Colors.deepPurple,
                            ),
                          ),
                        ),
                        PopupMenuButton(
                          itemBuilder: (ctx) => [
                            PopupMenuItem(
                              child: const Row(
                                children: [
                                  Icon(Icons.sync_rounded),
                                  Spacer(),
                                  Text('Sync'),
                                ],
                              ),
                              onTap: () async {
                                progressVisibleList.value = [
                                  ...progressVisibleList.value
                                    ..removeAt(index)
                                    ..insert(index, true)
                                ];
                                final result = await ref
                                    .watch(folderProvider.notifier)
                                    .upload(e);
                                progressVisibleList.value = [
                                  ...progressVisibleList.value
                                    ..removeAt(index)
                                    ..insert(index, false)
                                ];

                                if (context.mounted) {
                                  result.match(
                                    (l) => ctx.showErrorSnackBar(l),
                                    (r) => ctx.showSuccessSnackBar(
                                      content: r,
                                      action: none(),
                                    ),
                                  );
                                }
                              },
                            ),
                            PopupMenuItem(
                              child: const Row(
                                children: [
                                  Icon(Icons.delete),
                                  Spacer(),
                                  Text('Delete'),
                                ],
                              ),
                              onTap: () {
                                ref.watch(folderProvider.notifier).delete(e);
                                ctx.showSuccessSnackBar(
                                  content: 'Deleted folder',
                                  action: none(),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
          ExpandableCardWidget(
            leading: Text('iefei'),
            trailing: Text('efhe'),
          ),
        ]),
      ),
    );
  }
}

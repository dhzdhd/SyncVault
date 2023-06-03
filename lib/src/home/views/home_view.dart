import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';
import 'package:syncvault/src/accounts/views/account_view.dart';
import 'package:syncvault/helpers.dart';
import 'package:syncvault/src/home/components/new_folder_dialog_widget.dart';
import 'package:system_tray/system_tray.dart';

import '../../settings/views/settings_view.dart';

class HomeView extends ConsumerWidget {
  const HomeView({
    super.key,
  });

  static const routeName = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final folderInfo = ref.watch(folderProvider);

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
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: folderInfo
              .map(
                (e) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 32.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.folderName.substring(10).capitalize(),
                                style: const TextStyle(fontSize: 25),
                              ),
                              Text(
                                e.folderPath,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
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
                              onTap: () {
                                ctx.showSuccessSnackBar(
                                  content: 'Synced successfully',
                                  action: none(),
                                );
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
        ),
      ),
    );
  }
}

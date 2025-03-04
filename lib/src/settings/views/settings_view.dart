import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/helpers.dart';
import 'package:syncvault/src/common/components/sliver_animated_app_bar.dart';
import 'package:syncvault/src/home/controllers/folder_controller.dart';
import 'package:syncvault/src/common/services/rclone.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final settingsNotifier = ref.read(settingsProvider.notifier);
    final folderNotifier = ref.read(folderProvider.notifier);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAnimatedAppBar(title: 'Settings'),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  ListTile(
                    minTileHeight: 84,
                    title: Text(
                      'Theme',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    trailing: DropdownMenu<ThemeMode>(
                      width: 180,
                      enableSearch: false,
                      enableFilter: false,
                      initialSelection: settings.themeMode,
                      onSelected: settingsNotifier.updateThemeMode,
                      dropdownMenuEntries: ThemeMode.values
                          .map(
                            (val) => DropdownMenuEntry(
                              value: val,
                              label: val.name.capitalize(),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  ListTile(
                    minTileHeight: 84,
                    title: Text(
                      'Enable Sentry monitoring',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    trailing: Switch(
                      value: settings.isSentryEnabled,
                      onChanged: (val) {
                        settingsNotifier.setSentry();
                      },
                    ),
                  ),
                  if (PlatformExtension.isDesktop)
                    ListTile(
                      minTileHeight: 84,
                      title: Text(
                        'Hide on startup',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      trailing: Switch(
                        value: settings.isHideOnStartup,
                        onChanged: (val) {
                          settingsNotifier.setHideOnStartup();
                        },
                      ),
                    ),
                  if (PlatformExtension.isDesktop)
                    ListTile(
                      minTileHeight: 84,
                      title: Text(
                        'Download RClone',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      subtitle: const Text('Download RClone binary'),
                      onTap: () async {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Are you sure'),
                            actions: [
                              const OutlinedButton(
                                onPressed: null,
                                child: Text('Yes'),
                              ),
                              FilledButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('No'),
                              )
                            ],
                          ),
                        );
                      },
                      // TODO:
                    ),
                  Visibility(
                    visible: kDebugMode && !Platform.isIOS,
                    child: ListTile(
                      minTileHeight: 84,
                      title: Text(
                        'Show RClone config',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      subtitle:
                          const Text('Show the entire RClone config file'),
                      onTap: () async {
                        final config = await RCloneUtils().getIniConfig().run();
                        config.match((e) => {}, (ini) async {
                          showDialog(
                            context: context,
                            builder: (ctx) => SimpleDialog(
                              title: const Text('Config'),
                              children: ini
                                  .sections()
                                  .map(
                                    (section) => ListTile(
                                      minTileHeight: 84,
                                      title: Text(section),
                                      subtitle:
                                          Text(ini.items(section).toString()),
                                    ),
                                  )
                                  .toList(),
                            ),
                          );
                        });
                      },
                    ),
                  ),
                  ListTile(
                    minTileHeight: 84,
                    title: Text(
                      'Clear local folder storage',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    subtitle: const Text(
                        'Clear all local folder storage, does not include settings'),
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Are you sure'),
                          actions: [
                            OutlinedButton(
                              onPressed: () async {
                                await folderNotifier.clearCache();
                                if (context.mounted) {
                                  Navigator.of(context).pop();
                                }
                              },
                              child: const Text('Yes'),
                            ),
                            FilledButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('No'),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  ListTile(
                    minTileHeight: 84,
                    title: Text(
                      'Reset settings',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    subtitle: const Text('Reset all settings to default'),
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Are you sure'),
                          actions: [
                            OutlinedButton(
                              onPressed: () async {
                                settingsNotifier.resetSettings();
                                if (context.mounted) {
                                  Navigator.of(context).pop();
                                }
                              },
                              child: const Text('Yes'),
                            ),
                            FilledButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('No'),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

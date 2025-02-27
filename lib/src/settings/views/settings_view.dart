import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/helpers.dart';
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
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Theme',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      child: DropdownMenu<ThemeMode>(
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
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 10,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Enable Sentry monitoring',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Switch(
                          value: settings.isSentryEnabled,
                          onChanged: (val) {
                            settingsNotifier.setSentry();
                          },
                        )
                      ],
                    ),
                    if (PlatformExtension.isDesktop)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Hide on startup',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Switch(
                            value: settings.isHideOnStartup,
                            onChanged: (val) {
                              settingsNotifier.setHideOnStartup();
                            },
                          )
                        ],
                      ),
                    if (!Platform.isIOS)
                      // IOS only supports manual
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Set RClone as default backend',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Switch(
                            value: settings.isRCloneDefault,
                            onChanged: (val) {
                              settingsNotifier.setRCloneDefaultBackend();
                            },
                          )
                        ],
                      ),
                    if (PlatformExtension.isDesktop)
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () async {
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
                          child: const Text(
                            'Download RClone',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    // Visible only in debug mode
                    Visibility(
                      visible: kDebugMode && !Platform.isIOS,
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () async {
                            final config =
                                await RCloneUtils().getIniConfig().run();
                            config.match((e) => {}, (ini) async {
                              showDialog(
                                context: context,
                                builder: (ctx) => SimpleDialog(
                                  title: const Text('Config'),
                                  children: ini
                                      .sections()
                                      .map(
                                        (section) => ListTile(
                                          title: Text(section),
                                          subtitle: Text(
                                              ini.items(section).toString()),
                                        ),
                                      )
                                      .toList(),
                                ),
                              );
                            });
                          },
                          child: const Text(
                            'Show RClone config',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () async {
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
                        child: const Text(
                          'Clear local folder storage',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () async {
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
                        child: const Text(
                          'Reset settings',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

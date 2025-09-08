import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/extensions.dart';
import 'package:syncvault/src/common/components/sliver_animated_app_bar.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';
import 'package:syncvault/src/common/services/rclone.dart';
import 'package:syncvault/src/home/controllers/connection_controller.dart';
import 'package:syncvault/src/introduction/controllers/intro_controller.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({super.key});

  static const routeName = '/settings';

  @override
  ConsumerState<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends ConsumerState<SettingsView> {
  late final TextEditingController _rClonePathController;

  @override
  void initState() {
    super.initState();

    final settings = ref.read(settingsProvider);
    _rClonePathController = TextEditingController(text: settings.rClonePath);
  }

  @override
  void dispose() {
    _rClonePathController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);
    final settingsNotifier = ref.read(settingsProvider.notifier);
    final folderNotifier = ref.read(folderProvider.notifier);
    final connectionNotifier = ref.read(connectionProvider.notifier);

    ref.listen<AsyncValue>(rCloneDownloadControllerProvider, (prev, state) {
      if (!state.isLoading && state.hasError) {
        context.showErrorSnackBar(
          GeneralError(
            'RClone download controller failed',
            state.error!,
            state.stackTrace,
          ).logError().message,
        );
      }
    });

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAnimatedAppBar(title: 'Settings'),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed([
                ListTile(
                  minTileHeight: 64,
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
                  minTileHeight: 64,
                  title: Text(
                    'Enable Sentry monitoring',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  trailing: Switch(
                    value: settings.isSentryEnabled,
                    onChanged: (val) {
                      settingsNotifier.toggleSentryEnabled();
                    },
                  ),
                ),
                if (PlatformExtension.isDesktop)
                  ListTile(
                    minTileHeight: 64,
                    title: Text(
                      'Hide on startup',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    trailing: Switch(
                      value: settings.isHideOnStartup,
                      onChanged: (val) {
                        settingsNotifier.toggleHideOnStartup();
                      },
                    ),
                  ),
                if (PlatformExtension.isDesktop)
                  ListTile(
                    minTileHeight: 64,
                    title: Text(
                      'Launch on startup',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    trailing: Switch(
                      value: settings.isLaunchOnStartup,
                      onChanged: (val) {
                        settingsNotifier.toggleLaunchOnStartup();
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                Visibility(
                  visible: PlatformExtension.isDesktop,
                  child: ListTile(
                    minTileHeight: 64,
                    title: Text(
                      'Change RClone path',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    subtitle: const Text(
                      'Change RClone path from the default of - <documents_directory>/SyncVault/rclone.conf',
                    ),
                    onTap: () async {
                      final config = await RCloneUtils().getIniConfig().run();
                      config.match((e) => {}, (ini) async {
                        showDialog(
                          context: context,
                          builder: (ctx) => SimpleDialog(
                            contentPadding: EdgeInsetsGeometry.all(24),
                            title: const Text('Change RClone path'),
                            children: [
                              TextField(
                                controller: _rClonePathController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Path',
                                ),
                              ),
                              SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  settingsNotifier.updateRClonePath(
                                    path: _rClonePathController.text,
                                  );
                                },
                                child: Text('Submit'),
                              ),
                            ],
                          ),
                        );
                      });
                    },
                  ),
                ),
                if (PlatformExtension.isDesktop)
                  ListTile(
                    minTileHeight: 64,
                    title: Text(
                      'Download RClone',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    subtitle: const Text('Download RClone binary'),
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (context) => Consumer(
                          builder: (context, ref, child) {
                            final rCloneDownloadProgress = ref.watch(
                              rCloneDownloadControllerProvider,
                            );
                            final rCloneDownloadControllerNotifier = ref.read(
                              rCloneDownloadControllerProvider.notifier,
                            );

                            final inProgress =
                                rCloneDownloadProgress.isLoading ||
                                (rCloneDownloadProgress.value != null &&
                                    rCloneDownloadProgress.value != 0);
                            final isComplete =
                                inProgress &&
                                rCloneDownloadProgress.value == 100;

                            return AlertDialog(
                              title: Text(
                                inProgress
                                    ? isComplete
                                          ? 'Downloaded'
                                          : 'Downloading'
                                    : 'Are you sure',
                              ),
                              actions: [
                                OutlinedButton(
                                  onPressed: inProgress
                                      ? null
                                      : () async {
                                          await rCloneDownloadControllerNotifier
                                              .rCloneDownload();
                                        },
                                  child: Text(
                                    inProgress
                                        ? rCloneDownloadProgress.value == 100
                                              ? 'Complete'
                                              : 'Progress ${rCloneDownloadProgress.value ?? 0}%'
                                        : 'Yes',
                                  ),
                                ),
                                Visibility(
                                  visible: !(isComplete || inProgress),
                                  child: FilledButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('No'),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    },
                  ),
                Visibility(
                  visible: kDebugMode && !Platform.isIOS,
                  child: ListTile(
                    minTileHeight: 64,
                    title: Text(
                      'Show RClone config',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    subtitle: const Text('Show the entire RClone config file'),
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
                                    minTileHeight: 64,
                                    title: Text(section),
                                    subtitle: Text(
                                      ini.items(section).toString(),
                                    ),
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
                  minTileHeight: 64,
                  title: Text(
                    'Clear local folder storage',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  subtitle: const Text(
                    'Clear all local folders and connections, does not include settings',
                  ),
                  onTap: () async {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Are you sure'),
                        actions: [
                          OutlinedButton(
                            onPressed: () async {
                              await folderNotifier.clearCache();
                              await connectionNotifier.clearCache();
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
                          ),
                        ],
                      ),
                    );
                  },
                ),
                ListTile(
                  minTileHeight: 64,
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
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

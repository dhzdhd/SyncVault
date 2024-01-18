import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

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
                    Text(
                      'Theme',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(
                      child: DropdownMenu<ThemeMode>(
                        width: 180,
                        enableSearch: false,
                        enableFilter: false,
                        initialSelection: controller.themeMode,
                        onSelected: controller.updateThemeMode,
                        dropdownMenuEntries: const [
                          DropdownMenuEntry(
                            value: ThemeMode.system,
                            label: 'System Theme',
                          ),
                          DropdownMenuEntry(
                            value: ThemeMode.light,
                            label: 'Light Theme',
                          ),
                          DropdownMenuEntry(
                            value: ThemeMode.dark,
                            label: 'Dark Theme',
                          )
                        ],
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Enable Sentry monitoring',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Switch(
                          value: settings.isSentryEnabled,
                          onChanged: (val) {
                            ref
                                .read(settingsProvider.notifier)
                                .setSentry(none());
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

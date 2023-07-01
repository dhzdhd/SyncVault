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
                      width: 150,
                      child: DropdownButton<ThemeMode>(
                        value: controller.themeMode,
                        onChanged: controller.updateThemeMode,
                        isExpanded: true,
                        items: const [
                          DropdownMenuItem(
                            value: ThemeMode.system,
                            child: Text('System Theme'),
                          ),
                          DropdownMenuItem(
                            value: ThemeMode.light,
                            child: Text('Light Theme'),
                          ),
                          DropdownMenuItem(
                            value: ThemeMode.dark,
                            child: Text('Dark Theme'),
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

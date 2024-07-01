import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncvault/src/introduction/controllers/intro_controller.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:syncvault/helpers.dart';
import 'package:syncvault/errors.dart';

class IntroductionView extends StatefulHookConsumerWidget {
  const IntroductionView({
    super.key,
  });

  static const routeName = '/introduction';

  @override
  ConsumerState<IntroductionView> createState() => _IntroductionViewState();
}

class _IntroductionViewState extends ConsumerState<IntroductionView> {
  @override
  Widget build(BuildContext context) {
    final rCloneDownloadProgress = ref.watch(rCloneDownloadControllerProvider);
    final rCloneDownloadControllerNotifier =
        ref.read(rCloneDownloadControllerProvider.notifier);

    ref.listen<AsyncValue>(
      rCloneDownloadControllerProvider,
      (prev, state) {
        if (!state.isLoading && state.hasError) {
          context.showErrorSnackBar(state.error!.segregateError().message);
        }
      },
    );

    return Scaffold(
      body: IntroductionScreen(
        next: const Text('Next'),
        done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w700)),
        back: const Text('Back'),
        showBackButton: true,
        dotsDecorator: DotsDecorator(
          activeColor: Theme.of(context).colorScheme.primary,
        ),
        onDone: () {
          Navigator.of(context).popAndPushNamed('/home');
        },
        pages: [
          PageViewModel(
            title: 'SyncVault',
            body:
                'Welcome to the app! There are a few steps to be completed before you can use the app',
            image: const Center(
              child: Icon(Icons.waving_hand, size: 50.0),
            ),
          ),
          if (Platform.isAndroid)
            PageViewModel(
              title: 'Folder permissions',
              body:
                  'SyncVault requires access to all files to operate normally.',
              image: const Center(
                child: Icon(Icons.folder, size: 50.0),
              ),
              footer: Center(
                child: FilledButton(
                  onPressed: () async {
                    await Permission.manageExternalStorage
                        .onDeniedCallback(() {})
                        .onGrantedCallback(() {})
                        .request();
                  },
                  child: const Text('Give permissions'),
                ),
              ),
            ),
          if (Platform.isAndroid)
            PageViewModel(
              title: 'Battery permissions',
              body:
                  'SyncVault requires you to remove battery optimizations to operate normally.',
              image: const Center(
                child: Icon(Icons.battery_saver, size: 50.0),
              ),
              footer: Center(
                child: FilledButton(
                  onPressed: () async {
                    await Permission.ignoreBatteryOptimizations
                        .onDeniedCallback(() {})
                        .onGrantedCallback(() {})
                        .request();
                  },
                  child: const Text('Give permissions'),
                ),
              ),
            ),
          if (Platform.isAndroid)
            PageViewModel(
              title: 'Notification permissions',
              body:
                  'SyncVault requires notification permissions to notify you during sync.',
              image: const Center(
                child: Icon(Icons.notifications, size: 50.0),
              ),
              footer: Center(
                child: FilledButton(
                  onPressed: () async {
                    await Permission.notification
                        .onDeniedCallback(() {})
                        .onGrantedCallback(() {})
                        .request();
                  },
                  child: const Text('Give permissions'),
                ),
              ),
            ),
          PageViewModel(
            title: 'Download RClone',
            bodyWidget: Column(
              children: [
                const Text(
                  'SyncVault requires you to download RClone which serves as the backend of the app.\nRClone is an open source software that syncs your files to cloud storage.',
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  onPressed: () async {
                    final res = await launchUrlString(
                        'https://github.com/rclone/rclone');
                    if (!res && context.mounted) {
                      context.showErrorSnackBar('Failed to open URL');
                    }
                  },
                  child: const Text('RClone Github page'),
                )
              ],
            ),
            image: const Center(
              child: Icon(Icons.download, size: 50.0),
            ),
            footer: Center(
              child: FilledButton(
                onPressed: (rCloneDownloadProgress.isLoading ||
                        (rCloneDownloadProgress.value != null &&
                            rCloneDownloadProgress.value != 0))
                    ? null
                    : () async {
                        await rCloneDownloadControllerNotifier.rCloneDownload();
                      },
                child: Text(rCloneDownloadProgress.isLoading ||
                        rCloneDownloadProgress.value != null &&
                            rCloneDownloadProgress.value != 0
                    ? rCloneDownloadProgress.value == 100
                        ? 'Complete'
                        : 'Progress ${rCloneDownloadProgress.value ?? 0}%'
                    : 'Download RClone'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

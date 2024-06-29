import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:permission_handler/permission_handler.dart';

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
    return Scaffold(
      body: IntroductionScreen(
        next: const Text('Next'),
        done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w700)),
        back: const Text('Back'),
        showBackButton: true,
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
          PageViewModel(
            title: 'Folder permissions',
            body: 'SyncVault requires access to all files to operate normally.',
            image: const Center(
              child: Icon(Icons.folder, size: 50.0),
            ),
            footer: Center(
              child: FilledButton(
                onPressed: () async {
                  await Permission.accessMediaLocation
                      .onDeniedCallback(() {})
                      .onGrantedCallback(() {})
                      .request();
                },
                child: const Text('Give permissions'),
              ),
            ),
          ),
          PageViewModel(
            title: 'Battery permissions',
            body:
                'SyncVault requires you to remove battery optimizations to operate normally.',
            image: const Center(
              child: Icon(Icons.folder, size: 50.0),
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
          PageViewModel(
            title: 'Notification permissions',
            body:
                'SyncVault requires notification permissions to notify you during sync.',
            image: const Center(
              child: Icon(Icons.folder, size: 50.0),
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
          )
        ],
      ),
    );
  }
}

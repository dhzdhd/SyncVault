import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';

class DriveInfoDialogWidget extends HookConsumerWidget {
  const DriveInfoDialogWidget({super.key, required this.model});

  final AuthProviderModel model;

  String getSize(num val) {
    final mb = val / (1000 * 1000);
    if (mb > 1000) {
      return '${(mb / 1000).toStringAsFixed(2)} GB';
    } else {
      return '${mb.toStringAsFixed(2)} MB';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final driveInfoController = ref.watch(driveInfoControllerProvider(model));

    return SimpleDialog(
      title: switch (driveInfoController) {
        AsyncError() => const Text('Error'),
        _ => const Text('Drive info'),
      },
      contentPadding: const EdgeInsets.all(24),
      children: driveInfoController.when(
        data: (model) {
          return [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Center(
                child: Stack(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Center(
                        child: Text(
                          '${(model.usedStorage / model.totalStorage * 100).toStringAsFixed(2)} %\nused',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        value: model.usedStorage / model.totalStorage,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Storage used',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      getSize(model.usedStorage),
                      style: Theme.of(context).textTheme.headlineSmall,
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Storage remaining',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      getSize(model.remainingStorage),
                      style: Theme.of(context).textTheme.headlineSmall,
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Total storage',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      getSize(model.totalStorage),
                      style: Theme.of(context).textTheme.headlineSmall,
                    )
                  ],
                ),
              ),
            ),
          ];
        },
        loading: () => [
          const Center(
            child: CircularProgressIndicator(),
          )
        ],
        error: (e, st) => [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(e.segregateError().message),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/errors.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/models/drive_info_model.dart';
import 'package:syncvault/src/common/components/circular_progress_widget.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';

class DriveInfoDialogWidget extends HookConsumerWidget {
  const DriveInfoDialogWidget({super.key, required this.model});

  final DriveProviderModel model;

  String getSize(num val) {
    final mb = val / (1000 * 1000);
    if (mb > 1000) {
      return '${(mb / 1000).toStringAsFixed(2)} GB';
    } else {
      return '${mb.toStringAsFixed(2)} MB';
    }
  }

  double getPercent(DriveInfoModel driveInfoModel) {
    return driveInfoModel.usedStorage.isSome() &&
            driveInfoModel.totalStorage.isSome()
        ? driveInfoModel.usedStorage.toNullable()! /
            (driveInfoModel.totalStorage.toNullable()! + 0.0001)
        : 0;
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
      children: switch (driveInfoController) {
        AsyncData(:final value) => [
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
                          // Avoid zero div error
                          '${(getPercent(value) * 100).toStringAsFixed(0)}%\nused',
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
                      // TODO: Use custom progress widget
                      child: CircularProgressIndicator(
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        value:
                            // Avoid zero div error
                            getPercent(value),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: value.usedStorage.isSome(),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Storage used',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        getSize(value.usedStorage.toNullable() ?? 0),
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: value.remainingStorage.isSome(),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Storage remaining',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        getSize(value.remainingStorage.toNullable() ?? 0),
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: value.totalStorage.isSome(),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Total storage',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        getSize(value.totalStorage.toNullable() ?? 0),
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        AsyncError(:final error) => [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(error.handleError().message),
            ),
          ],
        AsyncLoading() => [
            const CircularProgressWidget(size: 300, isInfinite: true)
          ],
        _ => [], // TODO:
      },
    );
  }
}

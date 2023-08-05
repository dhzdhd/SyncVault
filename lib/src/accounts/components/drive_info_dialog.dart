import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/models/folder_info_model.dart';

class DriveInfoDialogWidget extends HookConsumerWidget {
  const DriveInfoDialogWidget({Key? key, required this.model})
      : super(key: key);

  final FolderInfoModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialog(
      title: const Text('Drive info'),
      contentPadding: const EdgeInsets.all(24),
      children: [
        Center(
          child: Stack(
            children: [
              SizedBox(
                width: 75,
                height: 75,
                child: Center(
                  child: Text(
                    '${(model.usedStorage / model.totalStorage * 100).toStringAsFixed(2)} %\nused',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 75,
                height: 75,
                child: CircularProgressIndicator(
                  value: model.usedStorage / model.totalStorage,
                ),
              ),
            ],
          ),
        ),
        // ! Use cards to display
        Text(
          'Used - ${(model.usedStorage / (1000 * 1000)).toStringAsFixed(0)} MB',
        ),
        Text(
          'Remaining - ${(model.remainingStorage / (1000 * 1000)).toStringAsFixed(0)} MB',
        )
      ],
    );
  }
}

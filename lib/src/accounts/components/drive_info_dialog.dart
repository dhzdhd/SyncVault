import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';

class DriveInfoDialogWidget extends HookConsumerWidget {
  const DriveInfoDialogWidget({Key? key, required this.model})
      : super(key: key);

  final AuthProviderModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProvider = useState(AuthProviderType.oneDrive);

    return SimpleDialog(
      title: const Text('Drive info'),
      contentPadding: const EdgeInsets.all(24),
      children: [
        Stack(
          children: [
            SizedBox(
              width: 75,
              height: 75,
              child: Center(
                child: Text(
                  '{(e.usedStorage / e.remainingStorage * 100).toStringAsFixed(2)} %\nused',
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
                  // value: e.usedStorage / e.remainingStorage,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}

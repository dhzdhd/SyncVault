import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';

class DeleteAccountDialogWidget extends ConsumerWidget {
  const DeleteAccountDialogWidget({super.key, required this.model});

  final DriveProviderModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authProvider.notifier);
    final folders = ref.watch(folderProvider);

    return AlertDialog(
      title: const Text('Delete account?'),
      content: Text(
        // Change message depending on account containing linked folders.
        '',
        // folders.any(
        //       (element) =>
        //           element.firstRemote == model.remoteName ||
        //           element.secondRemote == model.remoteName,
        //     )
        //     ? 'The account contains dependent folders. Are you sure you want to sign out?\n This action will not delete the folders stored locally/in your drive.'
        //     : 'This action will not delete the folders stored locally/in your drive.',
        textAlign: TextAlign.left,
      ),
      actions: [
        TextButton(
          onPressed: () {
            authNotifier.signOut(model);
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          },
          child: const Text('Delete'),
        ),
        ElevatedButton(
          onPressed: () {
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';

class DeleteAccountDialogWidget extends ConsumerWidget {
  const DeleteAccountDialogWidget({super.key, required this.model});

  final RemoteProviderModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authProvider.notifier);
    final folders = ref
        .watch(folderProvider)
        .filter(
          (folderModel) =>
              folderModel is RemoteFolderModel &&
              folderModel.remoteName == model.remoteName,
        );

    return AlertDialog(
      title: const Text('Delete account?'),
      content: Text(
        folders.isNotEmpty
            ? 'The account contains dependent folders. Are you sure you want to delete?\n This action will not delete the folders stored locally/in your drive.'
            : 'This action will not delete the folders stored locally/in your drive.',
        textAlign: TextAlign.left,
      ),
      actions: [
        TextButton(
          onPressed: () async {
            await authNotifier.signOut(model);
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

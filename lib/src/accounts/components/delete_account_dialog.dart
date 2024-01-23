import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';
import 'package:syncvault/src/accounts/models/auth_provider_model.dart';

class DeleteAccountDialogWidget extends ConsumerWidget {
  const DeleteAccountDialogWidget({super.key, required this.model});

  final AuthProviderModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('Delete account?'),
      content: Text(
        ref.watch(folderProvider).any(
                  (element) => element.email == model.email,
                )
            ? 'The account contains dependent folders. Are you sure you want to sign out?\n This action will not delete the folders stored locally/in your drive.'
            : 'This action will not delete the folders stored locally/in your drive.',
        textAlign: TextAlign.left,
      ),
      actions: [
        TextButton(
            onPressed: () {
              ref.read(authProvider.notifier).signOut(model);
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
            child: const Text('Delete')),
        ElevatedButton(
          onPressed: () {
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          },
          child: const Text('Cancel'),
        )
      ],
    );
  }
}

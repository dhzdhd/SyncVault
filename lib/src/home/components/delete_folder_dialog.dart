import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/home/controllers/folder_controller.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';

class DeleteFolderDialogWidget extends ConsumerWidget {
  const DeleteFolderDialogWidget({super.key, required this.model});

  final FolderModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final folderNotifier = ref.read(uploadDeleteControllerProvider.notifier);

    return AlertDialog(
      title: Text('Delete ${model.title}?'),
      content: const Text(
        'Remote delete deletes the local state and uploaded files.\nLocal delete deletes only local state.\nThis does not affect your local files.',
        textAlign: TextAlign.left,
      ),
      actions: [
        TextButton(
          onPressed: () async {
            if (context.mounted) {
              Navigator.of(context).pop();
            }
            await folderNotifier.delete(model, true);
          },
          child: const Text('Remote Delete'),
        ),
        TextButton(
          onPressed: () async {
            if (context.mounted) {
              Navigator.of(context).pop();
            }
            await folderNotifier.delete(model, false);
          },
          child: const Text('Local Delete'),
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

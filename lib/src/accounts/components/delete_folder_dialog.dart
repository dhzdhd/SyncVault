import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';

class DeleteFolderDialogWidget extends HookConsumerWidget {
  const DeleteFolderDialogWidget({super.key, required this.model});

  final FolderModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deleteFolderControllerNotifier = ref.read(
      deleteFolderControllerProvider.notifier,
    );
    final isDeleteFolder = useState(false);

    return AlertDialog(
      title: Text('Delete ${model.folderName}?'),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 20,
        children: [
          const Text('Delete corresponding local/remote folder'),
          Switch(
            value: isDeleteFolder.value,
            onChanged: (val) {
              isDeleteFolder.value = val;
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () async {
            if (context.mounted) {
              Navigator.of(context).pop();
            }
            await deleteFolderControllerNotifier.delete(
              model,
              isDeleteFolder.value,
            );
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

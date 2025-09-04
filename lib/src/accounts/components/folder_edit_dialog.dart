import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/extensions.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';

class FolderEditDialogWidget extends StatefulHookConsumerWidget {
  const FolderEditDialogWidget({super.key, required this.model});

  final FolderModel model;

  @override
  ConsumerState<FolderEditDialogWidget> createState() =>
      _FolderEditDialogWidgetState();
}

class _FolderEditDialogWidgetState
    extends ConsumerState<FolderEditDialogWidget> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.model.folderName);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final folderNotifier = ref.read(folderProvider.notifier);

    return SimpleDialog(
      title: Text('Edit folder'),
      contentPadding: EdgeInsetsGeometry.all(24),
      children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Folder name',
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          child: const Text('Submit'),
          onPressed: () async {
            if (_nameController.text.isNotEmpty) {
              await folderNotifier.edit(
                oldFolder: widget.model,
                newFolder: widget.model.copyWith(
                  folderName: _nameController.text,
                ),
              );

              // TODO: Show this only on no error
              if (context.mounted) {
                context.showSuccessSnackBar(
                  content: 'Successfully edited folder',
                );
                Navigator.of(context).pop();
              }
            }
          },
        ),
      ],
    );
  }
}

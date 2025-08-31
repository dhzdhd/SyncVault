import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/extensions.dart';
import 'package:syncvault/src/home/controllers/connection_controller.dart';
import 'package:syncvault/src/home/models/connection_model.dart';

class ConnectionEditDialogWidget extends StatefulHookConsumerWidget {
  const ConnectionEditDialogWidget({super.key, required this.model});

  final ConnectionModel model;

  @override
  ConsumerState<ConnectionEditDialogWidget> createState() =>
      _ConnectionEditDialogWidgetState();
}

class _ConnectionEditDialogWidgetState
    extends ConsumerState<ConnectionEditDialogWidget> {
  late final TextEditingController _titleController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.model.title);
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedDirection = useState<Set<SyncDirection>>({
      widget.model.direction,
    });

    final connectionNotifier = ref.read(connectionProvider.notifier);

    return SimpleDialog(
      title: Text('Edit connection'),
      contentPadding: EdgeInsetsGeometry.all(24),
      children: [
        TextField(
          controller: _titleController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Title',
          ),
        ),
        const SizedBox(height: 16),
        SegmentedButton<SyncDirection>(
          showSelectedIcon: false,
          segments: SyncDirection.values
              .map(
                (dir) => ButtonSegment(
                  value: dir,
                  label: Text(dir.name),
                  icon: Icon(switch (dir) {
                    SyncDirection.bidirectional => Icons.sync,
                    SyncDirection.upload => Icons.upload,
                    SyncDirection.download => Icons.download,
                  }),
                ),
              )
              .toList(),
          selected: selectedDirection.value,
          onSelectionChanged: (val) {
            selectedDirection.value = val;
          },
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          child: const Text('Submit'),
          onPressed: () async {
            if (_titleController.text.isNotEmpty) {
              await connectionNotifier.edit(
                oldConnection: widget.model,
                newConnection: ConnectionModel(
                  id: widget.model.id,
                  title: _titleController.text,
                  firstFolderId: widget.model.firstFolderId,
                  secondFolderId: widget.model.secondFolderId,
                  direction: selectedDirection.value.first,
                  isAutoSync: widget.model.isAutoSync,
                  isDeletionEnabled: widget.model.isDeletionEnabled,
                ),
              );

              // TODO: Show this only on no error
              if (context.mounted) {
                context.showSuccessSnackBar(
                  content: 'Successfully edited connection',
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

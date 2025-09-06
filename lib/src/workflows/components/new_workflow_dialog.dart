import 'package:flutter/material.dart';
import 'package:hashlib/random.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/extensions.dart';
import 'package:syncvault/src/workflows/controllers/workflow_controller.dart';
import 'package:syncvault/src/workflows/models/workflow_model.dart';
import 'package:syncvault/src/workflows/views/workflow_editor_view.dart';

class NewWorkflowWidget extends StatefulHookConsumerWidget {
  const NewWorkflowWidget({super.key});

  @override
  ConsumerState<NewWorkflowWidget> createState() => _NewWorkflowWidgetState();
}

class _NewWorkflowWidgetState extends ConsumerState<NewWorkflowWidget> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final workflowNotifier = ref.read(workflowProvider.notifier);

    return SimpleDialog(
      title: const Text('Create new workflow'),
      contentPadding: const EdgeInsets.all(24),
      children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Name of workflow',
          ),
        ),
        const SizedBox(height: 32),
        ElevatedButton(
          child: const Text('Submit'),
          onPressed: () async {
            if (_nameController.text.isEmpty) {
              context.showErrorSnackBar('Workflow name cannot be empty');
              return;
            }

            final model = WorkflowModel(
              id: uuid.v4(),
              name: _nameController.text,
              workflowJson: null,
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            );
            await workflowNotifier.create(model: model);

            if (context.mounted) {
              Navigator.of(context).pop();
              Navigator.of(context).push<void>(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) =>
                      WorkflowEditorView(workflowModel: model),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/helpers.dart';
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

            Navigator.of(context).pop();
            Navigator.of(context).push<void>(
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>
                    WorkflowEditorView(workflowName: _nameController.text),
              ),
            );
          },
        ),
      ],
    );
  }
}

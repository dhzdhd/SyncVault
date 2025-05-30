import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/workflows/models/workflow_node_type.dart';
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
    final selectedWorkflowNodeType = useState<WorkflowNodeType>(
      WorkflowNodeType.local,
    );

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
        const SizedBox(height: 16),
        DropdownButton<WorkflowNodeType>(
          items: WorkflowNodeType.values
              .map(
                (item) => DropdownMenuItem<WorkflowNodeType>(
                  value: item,
                  child: Text(item.name.capitalize()),
                ),
              )
              .toList(),
          value: selectedWorkflowNodeType.value,
          isExpanded: true,
          hint: const Text('Enter provider account'),
          onChanged: (WorkflowNodeType? item) {
            selectedWorkflowNodeType.value = item!;
          },
        ),
        const SizedBox(height: 32),
        ElevatedButton(
          child: const Text('Submit'),
          onPressed: () async {
            if (_nameController.text.isEmpty) {
              context.showErrorSnackBar('Workflow name cannot be empty');
              return;
            }

            Navigator.of(context).push<void>(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => WorkflowEditorView(
                  workflowName: _nameController.text,
                  workflowNodeType: selectedWorkflowNodeType.value,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

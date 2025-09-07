import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/extensions.dart';
import 'package:syncvault/src/common/components/sliver_animated_app_bar.dart';
import 'package:syncvault/src/workflows/components/new_workflow_dialog.dart';
import 'package:syncvault/src/workflows/controllers/workflow_controller.dart';
import 'package:syncvault/src/workflows/views/workflow_editor_view.dart';

class WorkflowsView extends ConsumerWidget {
  const WorkflowsView({super.key});

  static const routeName = '/workflows';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workflows = ref.watch(workflowProvider);
    final workflowNotifier = ref.read(workflowProvider.notifier);
    final workflowControllerNotifier = ref.read(
      workflowControllerProvider.notifier,
    );

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'Create new workflow',
        onPressed: () async {
          if (context.mounted) {
            await showDialog(
              context: context,
              builder: (context) => const NewWorkflowWidget(),
            );
          }
        },
        child: const Icon(Icons.add),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAnimatedAppBar(
            title: 'Workflows',
            canExpand: workflows.isNotEmpty,
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 16,
              right: 16,
              bottom: 84,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed(
                workflows
                    .map(
                      (workflow) => Card(
                        margin: EdgeInsets.zero,
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                workflow.name,
                                style: MediaQuery.of(context).size.width < 500
                                    ? Theme.of(context).textTheme.titleLarge
                                    : Theme.of(context).textTheme.headlineSmall,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () async {
                                      if (workflow.workflowJson == null) {
                                        context.showErrorSnackBar(
                                          'Workflow not created yet',
                                        );
                                      } else {
                                        await workflowControllerNotifier.run(
                                          workflow: workflow,
                                        );
                                      }
                                    },
                                    child: Icon(Icons.play_arrow_rounded),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      if (context.mounted) {
                                        Navigator.of(context).push<void>(
                                          MaterialPageRoute<void>(
                                            builder: (BuildContext context) =>
                                                WorkflowEditorView(
                                                  workflowModel: workflow,
                                                ),
                                          ),
                                        );
                                      }
                                    },
                                    child: Icon(Icons.edit),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      await showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          title: Text('Are you sure?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () async {
                                                await workflowNotifier.delete(
                                                  workflow: workflow,
                                                );

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
                                        ),
                                      );
                                    },
                                    child: Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

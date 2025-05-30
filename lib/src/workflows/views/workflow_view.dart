import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/common/components/sliver_animated_app_bar.dart';
import 'package:syncvault/src/workflows/components/new_workflow_dialog.dart';
import 'package:syncvault/src/workflows/controllers/workflow_controller.dart';

class WorkflowsView extends ConsumerWidget {
  const WorkflowsView({super.key});

  static const routeName = '/workflows';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workflows = ref.watch(workflowProvider);

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
            padding: EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed(
                workflows
                    .map(
                      (workflow) => ListTile(
                        title: Text(workflow.name),
                        subtitle: Text(workflow.name),
                        onTap: () {
                          Navigator.of(
                            context,
                          ).pushNamed('/workflows/${workflow.name}');
                        },
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

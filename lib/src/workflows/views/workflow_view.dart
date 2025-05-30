import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/helpers.dart';
import 'package:syncvault/src/common/components/sliver_animated_app_bar.dart';
import 'package:syncvault/src/home/controllers/folder_controller.dart';

class WorkflowsView extends ConsumerWidget {
  const WorkflowsView({super.key});

  static const routeName = '/workflows';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final folders = ref.watch(folderProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'Create new workflow',
        onPressed: () async {
          if (folders.isEmpty) {
            context.showErrorSnackBar('No folders created yet');
            return;
          }

          if (context.mounted) {
            // TODO:
          }
        },
        child: const Icon(Icons.add),
      ),
      body: const CustomScrollView(
        slivers: [
          SliverAnimatedAppBar(title: 'Workflows'),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverList(delegate: SliverChildListDelegate.fixed([])),
          ),
        ],
      ),
    );
  }
}

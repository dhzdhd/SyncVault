import 'package:flutter/material.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/models/cloud_file_model.dart';

class TreeWidget extends ConsumerWidget {
  const TreeWidget({super.key, required this.files});

  final List<CloudFileModel> files;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final treeController = TreeController<CloudFileModel>(
      roots: files,
      childrenProvider: (CloudFileModel node) => node.children,
    );

    return AnimatedTreeView<CloudFileModel>(
      treeController: treeController,
      nodeBuilder: (BuildContext context, TreeEntry<CloudFileModel> entry) {
        return InkWell(
          onTap: () => treeController.toggleExpansion(entry.node),
          child: TreeIndentation(
            entry: entry,
            child: Text(entry.node.name),
          ),
        );
      },
    );
  }
}

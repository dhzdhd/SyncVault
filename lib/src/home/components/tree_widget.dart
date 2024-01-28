import 'package:flutter/material.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/models/cloud_file_model.dart';

class TreeWidget extends ConsumerStatefulWidget {
  const TreeWidget({super.key, required this.files});

  final List<CloudFileModel> files;

  @override
  ConsumerState<TreeWidget> createState() => _TreeWidgetState();
}

class _TreeWidgetState extends ConsumerState<TreeWidget> {
  late final TreeController<CloudFileModel> _treeController;

  @override
  void initState() {
    super.initState();

    _treeController = TreeController<CloudFileModel>(
      roots: widget.files,
      childrenProvider: (CloudFileModel node) => node.children,
    );
  }

  @override
  void dispose() {
    _treeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTreeView<CloudFileModel>(
      treeController: _treeController,
      nodeBuilder: (BuildContext context, TreeEntry<CloudFileModel> entry) {
        return InkWell(
          onTap: () => _treeController.toggleExpansion(entry.node),
          child: TreeIndentation(
            entry: entry,
            child: Padding(
              padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
              child: Text(
                entry.node.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        );
      },
    );
  }
}

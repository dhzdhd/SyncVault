import 'package:flutter/material.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/models/file_model.dart';

class TreeWidget extends ConsumerStatefulWidget {
  const TreeWidget({super.key, required this.files});

  final List<FileModel> files;

  @override
  ConsumerState<TreeWidget> createState() => _TreeWidgetState();
}

class _TreeWidgetState extends ConsumerState<TreeWidget> {
  late final TreeController<FileModel> _treeController;

  @override
  void initState() {
    super.initState();

    _treeController = TreeController<FileModel>(
      roots: widget.files,
      childrenProvider: (FileModel node) => node.children,
    );
  }

  @override
  void dispose() {
    _treeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTreeView<FileModel>(
      treeController: _treeController,
      nodeBuilder: (BuildContext context, TreeEntry<FileModel> entry) {
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

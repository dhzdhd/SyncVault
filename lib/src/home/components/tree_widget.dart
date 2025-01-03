import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/models/file_model.dart';

typedef Tuple = (String name, String size, bool isFolder);

class TreeWidget extends ConsumerWidget {
  const TreeWidget({super.key, required this.file});

  final FileModel file;

  TreeNode<Tuple> wrapWithTreeNode(FileModel fileModel) {
    final treeNode = TreeNode(
      data: (fileModel.name, fileModel.size, fileModel.children.isNotEmpty),
      key: fileModel.hashCode.toString(),
    );

    final children = fileModel.children.map((x) => wrapWithTreeNode(x));
    return treeNode..addAll(children);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverTreeView.simpleTyped<Tuple, TreeNode<Tuple>>(
          tree: wrapWithTreeNode(file),
          showRootNode: false,
          builder: (context, node) {
            return ListTile(
              leading: Icon(
                node.data!.$3 ? Icons.folder : Icons.file_copy,
              ),
              title: Text(node.data!.$1),
              subtitle: Text('${node.data!.$2} bytes'),
            );
          },
        ),
      ],
    );
  }
}

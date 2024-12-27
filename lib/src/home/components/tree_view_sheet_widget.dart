import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/home/components/tree_widget.dart';

class TreeViewSheetWidget extends ConsumerWidget {
  const TreeViewSheetWidget({super.key, required this.folderModel});

  final FolderModel folderModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final treeState = ref.watch(treeViewProvider(folderModel));

    return switch (treeState) {
      AsyncError() => const Text('Error'),
      AsyncLoading() => const Text('Loading'),
      AsyncData(:final value) => switch (value) {
          Some(:final value) => SizedBox(
              height: 200,
              width: 2500,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Flexible(child: TreeWidget(files: value.children)),
                  ],
                ),
              ),
            ),
          None() => const Text('Error')
        },
      _ =>
        const Text('bruh'), // TODO: Why are 3 states not exhausting AsyncValue?
    };
  }
}

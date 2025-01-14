import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/home/controllers/folder_controller.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/common/components/circular_progress_widget.dart';
import 'package:syncvault/src/home/components/tree_widget.dart';

class TreeViewSheetWidget extends ConsumerWidget {
  const TreeViewSheetWidget({super.key, required this.folderModel});

  final FolderModel folderModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final treeState = ref.watch(treeViewProvider(folderModel));

    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: switch (treeState) {
          AsyncError() => const Center(
              child: Text(
                'Error',
                style: TextStyle(fontSize: 24),
              ),
            ),
          AsyncLoading() => const Center(
              child: CircularProgressWidget(
                size: 300,
                isInfinite: true,
              ),
            ),
          AsyncData(:final value) => switch (value) {
              Some(:final value) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Flexible(child: TreeWidget(file: value)),
                  ],
                ),
              None() => const Center(
                  child: Text(
                    'No data found',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
            },
          _ => const Center(
              child: Text(
                'Error',
                style: TextStyle(fontSize: 24),
              ),
            ), // TODO: Why are 3 states not exhausting AsyncValue?
        },
      ),
    );
  }
}

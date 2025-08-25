import 'dart:convert';

import 'package:fl_nodes/fl_nodes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';
import 'package:syncvault/src/workflows/components/data_handlers.dart';
import 'package:syncvault/src/workflows/components/hierarchy.dart';
import 'package:syncvault/src/workflows/components/nodes.dart';
import 'package:syncvault/src/workflows/components/search.dart';

class WorkflowEditorView extends StatefulHookConsumerWidget {
  const WorkflowEditorView({super.key, required this.workflowName});

  final String workflowName;

  String get routeName => '/workflows/$workflowName';

  @override
  ConsumerState<WorkflowEditorView> createState() => _WorkflowEditorViewState();
}

class _WorkflowEditorViewState extends ConsumerState<WorkflowEditorView> {
  late final FlNodeEditorController _nodeEditorController;

  bool isHierarchyCollapsed = true;

  @override
  void initState() {
    super.initState();

    final folders = ref.read(folderProvider);

    _nodeEditorController = FlNodeEditorController(
      style: const FlNodeEditorStyle(
        highlightAreaStyle: FlHighlightAreaStyle(
          borderWidth: 0,
          color: Colors.transparent,
        ),
      ),
      projectSaver: (jsonData) async {
        return true;
      },
      projectLoader: (isSaved) async {
        if (!isSaved) {
          final bool? proceed = await showDialog<bool>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Unsaved Changes'),
                content: const Text(
                  'You have unsaved changes. Do you want to proceed without saving?',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text('Proceed'),
                  ),
                ],
              );
            },
          );

          if (proceed != true) return null;
        }

        return jsonDecode('');
      },
    );

    registerDataHandlers(_nodeEditorController);
    registerNodes(context, _nodeEditorController, folders);
  }

  @override
  void dispose() {
    _nodeEditorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Workflow Editor',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HierarchyWidget(
              controller: _nodeEditorController,
              isCollapsed: isHierarchyCollapsed,
            ),
            Expanded(
              child: FlNodeEditorWidget(
                controller: _nodeEditorController,
                expandToParent: true,
                overlay: () {
                  return [
                    FlOverlayData(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          spacing: 8,
                          children: [
                            IconButton.filled(
                              tooltip: 'Toggle Hierarchy Panel',
                              onPressed: () => setState(() {
                                isHierarchyCollapsed = !isHierarchyCollapsed;
                              }),
                              icon: Icon(
                                isHierarchyCollapsed
                                    ? Icons.keyboard_arrow_right
                                    : Icons.keyboard_arrow_left,
                                size: 32,
                              ),
                            ),
                            SearchWidget(controller: _nodeEditorController),
                            const Spacer(),
                            IconButton.filled(
                              tooltip: 'Toggle Snap to Grid',
                              onPressed: () => setState(() {
                                _nodeEditorController.enableSnapToGrid(
                                  !_nodeEditorController
                                      .config
                                      .enableSnapToGrid,
                                );
                              }),
                              icon: Icon(
                                _nodeEditorController.config.enableSnapToGrid
                                    ? Icons.grid_on
                                    : Icons.grid_off,
                                size: 32,
                              ),
                            ),
                            IconButton.filled(
                              tooltip: 'Execute Graph',
                              onPressed: () =>
                                  _nodeEditorController.runner.executeGraph(),
                              icon: const Icon(Icons.play_arrow, size: 32),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

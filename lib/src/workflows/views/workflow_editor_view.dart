import 'dart:convert';

import 'package:fl_nodes/fl_nodes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/extensions.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';
import 'package:syncvault/src/workflows/components/data_handlers.dart';
import 'package:syncvault/src/workflows/components/hierarchy.dart';
import 'package:syncvault/src/workflows/components/nodes.dart';
import 'package:syncvault/src/workflows/components/search.dart';
import 'package:syncvault/src/workflows/controllers/workflow_controller.dart';
import 'package:syncvault/src/workflows/models/workflow_model.dart';

class WorkflowEditorView extends StatefulHookConsumerWidget {
  const WorkflowEditorView({super.key, required this.workflowModel});

  final WorkflowModel workflowModel;

  String get routeName => '/workflows/${workflowModel.name}';

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
    _nodeEditorController = FlNodeEditorController();

    registerDataHandlers(_nodeEditorController);
    registerNodes(context, _nodeEditorController, folders);

    if (widget.workflowModel.workflowJson != null) {
      // Encode and decode necessary to ensure resulting type is Map<String, dynamic>
      final json = jsonDecode(jsonEncode(widget.workflowModel.workflowJson));

      _nodeEditorController.project.load(data: json);
    }
  }

  @override
  void dispose() {
    _nodeEditorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final workflowNotifier = ref.read(workflowProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Workflow Editor',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final nodesJson = _nodeEditorController.nodes.values
                  .map(
                    (node) =>
                        node.toJson(_nodeEditorController.project.dataHandlers),
                  )
                  .toList();

              final json = {
                'viewport': {
                  'offset': [
                    _nodeEditorController.project.viewportOffset.dx,
                    _nodeEditorController.project.viewportOffset.dy,
                  ],
                  'zoom': _nodeEditorController.project.viewportZoom,
                },
                'nodes': nodesJson,
              };

              await workflowNotifier.updateJson(
                model: widget.workflowModel.copyWith(workflowJson: json),
              );

              if (context.mounted) {
                context.showSuccessSnackBar(content: 'Saved workflow');
              }
            },
            icon: Icon(Icons.save),
          ),
        ],
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

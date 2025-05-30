import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fl_nodes/fl_nodes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/src/workflows/components/data_handlers.dart';
import 'package:syncvault/src/workflows/components/hierarchy.dart';
import 'package:syncvault/src/workflows/components/nodes.dart';
import 'package:syncvault/src/workflows/components/search.dart';
import 'package:syncvault/src/workflows/models/workflow_node_type.dart';

class WorkflowEditorView extends StatefulHookConsumerWidget {
  const WorkflowEditorView({
    super.key,
    required this.workflowName,
    required this.workflowNodeType,
  });

  final String workflowName;
  final WorkflowNodeType workflowNodeType;

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

    _nodeEditorController = FlNodeEditorController(
      style: const FlNodeEditorStyle(),
      projectSaver: (jsonData) async {
        final String? outputPath = await FilePicker.platform.saveFile(
          dialogTitle: 'Save Project',
          fileName: '${widget.workflowName}.json',
          type: FileType.custom,
          allowedExtensions: ['json'],
        );

        // outputPath should never be null as this project will never be run on the web
        if (outputPath != null) {
          final File file = File(outputPath);
          await file.writeAsString(jsonEncode(jsonData));

          return true;
        } else {
          return false;
        }
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

        final FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['json'],
        );

        if (result == null) return null;

        final File file = File(result.files.single.path!);
        final fileContent = await file.readAsString();

        return jsonDecode(fileContent);
      },
      projectCreator: (isSaved) async {
        if (isSaved) return true;

        final bool? proceed = await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Unsaved Changes'),
              content: const Text(
                'You have unsaved changes. Do you want to proceed without saving?',
              ),
              actions: <Widget>[
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

        return proceed == true;
      },
    );

    registerDataHandlers(_nodeEditorController);
    registerNodes(context, _nodeEditorController);

    const sampleProjectLink =
        'https://raw.githubusercontent.com/WilliamKarolDiCioccio/fl_nodes/refs/heads/main/example/assets/www/node_project.json';

    () async {
      final response = await Dio().getUri(Uri.parse(sampleProjectLink));
      _nodeEditorController.project.load(data: jsonDecode(response.data));
    }();
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
          'Workflows',
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

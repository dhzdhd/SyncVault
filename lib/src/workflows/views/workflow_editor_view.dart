import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fl_nodes/fl_nodes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncvault/helpers.dart';
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

    _nodeEditorController = FlNodeEditorController(
      style: const FlNodeEditorStyle(),
      projectSaver: (jsonData) async {
        final String? outputPath = await FilePicker.platform.saveFile(
          dialogTitle: 'Save Project',
          fileName: '${widget.workflowName}.json',
          type: FileType.custom,
          allowedExtensions: ['json'],
        );

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
      if (response.statusCode == 200) {
        _nodeEditorController.project.load(data: jsonDecode(response.data));
      } else {
        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Failed to load sample project. Please check your internet connection.',
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
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
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.blue,
                              ),
                              onPressed: () => setState(() {
                                isHierarchyCollapsed = !isHierarchyCollapsed;
                              }),
                              icon: Icon(
                                isHierarchyCollapsed
                                    ? Icons.keyboard_arrow_right
                                    : Icons.keyboard_arrow_left,
                                size: 32,
                                color: Colors.white,
                              ),
                            ),
                            SearchWidget(controller: _nodeEditorController),
                            const Spacer(),
                            IconButton.filled(
                              tooltip: 'Toggle Snap to Grid',
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.blue,
                              ),
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
                                color: Colors.white,
                              ),
                            ),
                            IconButton.filled(
                              tooltip: 'Execute Graph',
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.blue,
                              ),
                              onPressed: () =>
                                  _nodeEditorController.runner.executeGraph(),
                              icon: const Icon(
                                Icons.play_arrow,
                                size: 32,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FlOverlayData(
                      bottom: 0,
                      left: 0,
                      child: Opacity(
                        opacity: 0.5,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: PlatformExtension.isMobile
                              ? const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Touch Commands:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(' - Tap: Select Node'),
                                    Text(' - Double Tap: Clear Selection'),
                                    Text(' - Long Press: Open Context Menu'),
                                    Text(
                                      ' - Drag: Start Linking / Select Nodes',
                                    ),
                                    Text(' - Pinch: Zoom In/Out'),
                                    SizedBox(height: 8),
                                    Text(
                                      'Additional Gestures:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(' - Two-Finger Drag: Pan'),
                                  ],
                                )
                              : const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Mouse Commands:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(' - Left Click: Select Node'),
                                    Text(' - Right Click: Open Context Menu'),
                                    Text(' - Scroll: Zoom In/Out'),
                                    Text(' - Middle Click: Pan'),
                                    SizedBox(height: 8),
                                    Text(
                                      'Keyboard Commands:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(' - Ctrl + S: Save Project'),
                                    Text(' - Ctrl + O: Open Project'),
                                    Text(' - Ctrl + N: New Project'),
                                    Text(' - Ctrl + C: Copy Node'),
                                    Text(' - Ctrl + V: Paste Node'),
                                    Text(' - Ctrl + X: Cut Node'),
                                    Text(' - Delete | Backspace: Remove Node'),
                                    Text(' - Ctrl + Z: Undo'),
                                    Text(' - Ctrl + Y: Redo'),
                                  ],
                                ),
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

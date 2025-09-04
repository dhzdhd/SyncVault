import 'dart:async';

import 'package:flutter/material.dart';

import 'package:fl_nodes/fl_nodes.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/home/models/connection_model.dart';

void registerNodes(
  BuildContext context,
  FlNodeEditorController controller,
  List<FolderModel> folders,
) {
  controller.registerNodePrototype(
    NodePrototype(
      idName: 'folder',
      displayName: (ctx) => 'Folder',
      description: (ctx) => 'Holds a folder.',
      ports: [
        DataOutputPortPrototype<FolderModel>(
          idName: 'value',
          displayName: (ctx) => 'Value',
        ),
      ],
      fields: [
        FieldPrototype(
          idName: 'value',
          displayName: (ctx) => 'Value',
          dataType: FolderModel,
          defaultData: folders.first,
          visualizerBuilder: (val) => Text(val.folderName),
          editorBuilder: (context, removeOverlay, data, setData) =>
              DropdownButton<FolderModel>(
                items: folders
                    .map(
                      (folder) => DropdownMenuItem(
                        value: folder,
                        child: Text(folder.folderName),
                      ),
                    )
                    .toList(),
                value: data,
                onChanged: (newSelection) {
                  setData(newSelection, eventType: FieldEventType.submit);
                  removeOverlay();
                },
              ),
        ),
      ],
      onExecute: (ports, fields, state, f, p) async {
        p({('value', fields['value']!)});

        unawaited(f({('completed')}));
      },
    ),
  );
  controller.registerNodePrototype(
    NodePrototype(
      idName: 'connector',
      displayName: (ctx) => 'Connector',
      description: (ctx) => 'Applies a chosen operation to two folders.',
      styleBuilder: (state) =>
          FlNodeStyle(decoration: defaultNodeStyle(state).decoration),
      ports: [
        DataInputPortPrototype<FolderModel>(
          idName: 'firstFolder',
          displayName: (ctx) => 'First folder',
          // style: FlPortStyle(
          //   color: Theme.of(context).canvasColor,
          //   shape: FlPortShape.circle,
          // ),
        ),
        DataInputPortPrototype<FolderModel>(
          idName: 'secondFolder',
          displayName: (ctx) => 'Second folder',
          // style: FlPortStyle(
          //   color: Theme.of(context).canvasColor,
          //   shape: FlPortShape.circle,
          // ),
        ),
        DataOutputPortPrototype<FolderModel>(
          idName: 'firstFolderOut',
          displayName: (ctx) => 'First folder',
        ),
        DataOutputPortPrototype<FolderModel>(
          idName: 'secondFolderOut',
          displayName: (ctx) => 'Second folder',
        ),
      ],
      fields: [
        FieldPrototype(
          idName: 'operation',
          displayName: (ctx) => 'Operation',
          dataType: SyncDirection,
          defaultData: SyncDirection.upload,
          visualizerBuilder: (data) => Text(
            data.toString().split('.').last,
            style: const TextStyle(color: Colors.white),
          ),
          editorBuilder: (context, removeOverlay, data, setData) =>
              SegmentedButton<SyncDirection>(
                segments: SyncDirection.values
                    .map(
                      (dir) => ButtonSegment(value: dir, label: Text(dir.name)),
                    )
                    .toList(),
                selected: {data as SyncDirection},
                onSelectionChanged: (newSelection) {
                  setData(newSelection.first, eventType: FieldEventType.submit);
                  removeOverlay();
                },
                direction: Axis.horizontal,
              ),
        ),
      ],
      onExecute: (ports, fields, state, f, p) async {
        final a = ports['firstFolder']! as FolderModel;
        final b = ports['secondFolder']! as FolderModel;
        final op = fields['operation']! as SyncDirection;

        switch (op) {
          case SyncDirection.upload:
            p({('firstFolderOut', a), ('secondFolderOut', b)});
          case SyncDirection.download:
            p({('firstFolderOut', a), ('secondFolderOut', b)});
          case SyncDirection.bidirectional:
            p({('firstFolderOut', a), ('secondFolderOut', b)});
        }

        unawaited(f({('completed')}));
      },
    ),
  );
}

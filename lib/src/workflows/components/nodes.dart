import 'dart:async';

import 'package:flutter/material.dart';

import 'package:fl_nodes/fl_nodes.dart';
import 'package:syncvault/log.dart';
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
          styleBuilder: (state) => FlPortStyle(
            color: Theme.of(context).buttonTheme.colorScheme!.primary,
            shape: FlPortShape.circle,
          ),
        ),
      ],
      headerStyleBuilder: (state) => defaultNodeHeaderStyle(state).copyWith(
        decoration: BoxDecoration(
          color: Theme.of(context).buttonTheme.colorScheme!.primaryContainer,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
      ),
      styleBuilder: (state) => FlNodeStyle(
        decoration: BoxDecoration(
          color: Theme.of(context).buttonTheme.colorScheme!.surfaceContainer,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
      ),
      fields: [
        FieldPrototype(
          idName: 'value',
          displayName: (ctx) => 'Value',
          dataType: FolderModel,
          defaultData: folders.first,
          visualizerBuilder: (val) => Text(val.folderName),
          editorBuilder: (context, removeOverlay, data, setData) => SizedBox(
            width: 200,
            height: 300,
            child: ListView(
              children: folders
                  .map(
                    (folder) => ListTile(
                      title: Text(folder.folderName),
                      onTap: () {
                        setData(folder, eventType: FieldEventType.submit);
                        removeOverlay();
                      },
                    ),
                  )
                  .toList(),
            ),
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
      headerStyleBuilder: (state) => defaultNodeHeaderStyle(state).copyWith(
        decoration: BoxDecoration(
          color: Theme.of(context).buttonTheme.colorScheme!.primaryContainer,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
      ),
      styleBuilder: (state) => FlNodeStyle(
        decoration: BoxDecoration(
          color: Theme.of(context).buttonTheme.colorScheme!.surfaceContainer,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
      ),
      ports: [
        DataInputPortPrototype<FolderModel>(
          idName: 'firstFolder',
          displayName: (ctx) => 'First folder',
          styleBuilder: (state) => FlPortStyle(
            color: Theme.of(context).buttonTheme.colorScheme!.primary,
            shape: FlPortShape.circle,
          ),
        ),
        DataInputPortPrototype<FolderModel>(
          idName: 'secondFolder',
          displayName: (ctx) => 'Second folder',
          styleBuilder: (state) => FlPortStyle(
            color: Theme.of(context).buttonTheme.colorScheme!.primary,
            shape: FlPortShape.circle,
          ),
        ),
        DataOutputPortPrototype<FolderModel>(
          idName: 'firstFolderOut',
          displayName: (ctx) => 'First folder',
          styleBuilder: (state) => FlPortStyle(
            color: Theme.of(context).buttonTheme.colorScheme!.primary,
            shape: FlPortShape.circle,
          ),
        ),
        DataOutputPortPrototype<FolderModel>(
          idName: 'secondFolderOut',
          displayName: (ctx) => 'Second folder',
          styleBuilder: (state) => FlPortStyle(
            color: Theme.of(context).buttonTheme.colorScheme!.primary,
            shape: FlPortShape.circle,
          ),
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
        debugLogger.i('conn ports $ports');
        debugLogger.i('conn fields $fields');
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

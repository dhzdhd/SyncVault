import 'dart:async';

import 'package:flutter/material.dart';

import 'package:fl_nodes/fl_nodes.dart';

enum FileEventType { upsert, delete }

enum FileModelType { remote, local }

enum Operator { add, subtract, multiply, divide }

enum Comparator { equal, notEqual, greater, greaterEqual, less, lessEqual }

final FlPortStyle outputDataPortStyle = FlPortStyle(
  color: Colors.orange,
  shape: FlPortShape.circle,
  linkStyleBuilder: (state) => const FlLinkStyle(
    gradient: LinearGradient(
      colors: [Colors.orange, Colors.purple],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
    lineWidth: 3.0,
    drawMode: FlLinkDrawMode.solid,
    curveType: FlLinkCurveType.bezier,
  ),
);

const FlPortStyle inputDataPortStyle = FlPortStyle(
  color: Colors.purple,
  shape: FlPortShape.circle,
);

final FlPortStyle controlOutputPortStyle = FlPortStyle(
  color: Colors.green,
  shape: FlPortShape.triangle,
  linkStyleBuilder: (state) => const FlLinkStyle(
    gradient: LinearGradient(
      colors: [Colors.green, Colors.blue],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
    lineWidth: 3.0,
    drawMode: FlLinkDrawMode.solid,
    curveType: FlLinkCurveType.bezier,
  ),
);

const FlPortStyle controlInputPortStyle = FlPortStyle(
  color: Colors.blue,
  shape: FlPortShape.triangle,
);

NodePrototype createValueNode<T>({
  required String idName,
  required String displayName,
  required T defaultValue,
  required Widget Function(T data) visualizerBuilder,
  Function(dynamic data, Function(dynamic data) setData)? onVisualizerTap,
  Widget Function(
    BuildContext context,
    Function() removeOverlay,
    dynamic data,
    Function(dynamic data, {required FieldEventType eventType}) setData,
  )?
  editorBuilder,
}) {
  return NodePrototype(
    idName: idName,
    displayName: displayName,
    description: 'Holds a constant $T value.',
    ports: [
      ControlOutputPortPrototype(
        idName: 'completed',
        displayName: 'Completed',
        style: controlOutputPortStyle,
      ),
      DataOutputPortPrototype(
        idName: 'value',
        displayName: 'Value',
        dataType: T,
        style: outputDataPortStyle,
      ),
    ],
    fields: [
      FieldPrototype(
        idName: 'value',
        displayName: 'Value',
        dataType: T,
        defaultData: defaultValue,
        visualizerBuilder: (data) => visualizerBuilder(data as T),
        onVisualizerTap: onVisualizerTap,
        editorBuilder: editorBuilder,
      ),
    ],
    onExecute: (ports, fields, state, f, p) async {
      p({('value', fields['value']!)});

      unawaited(f({('completed')}));
    },
  );
}

void registerNodes(BuildContext context, FlNodeEditorController controller) {
  controller.registerNodePrototype(
    NodePrototype(
      idName: 'operator',
      displayName: 'Operator',
      description: 'Applies a chosen operation to two numbers.',
      styleBuilder: (state) => FlNodeStyle(
        decoration: defaultNodeStyle(state).decoration,
        headerStyleBuilder: (state) => defaultNodeHeaderStyle(state).copyWith(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(7),
              topRight: const Radius.circular(7),
              bottomLeft: Radius.circular(state.isCollapsed ? 7 : 0),
              bottomRight: Radius.circular(state.isCollapsed ? 7 : 0),
            ),
          ),
        ),
      ),
      ports: [
        ControlInputPortPrototype(
          idName: 'exec',
          displayName: 'Exec',
          style: controlInputPortStyle,
        ),
        DataInputPortPrototype(
          idName: 'a',
          displayName: 'A',
          dataType: double,
          style: inputDataPortStyle,
        ),
        DataInputPortPrototype(
          idName: 'b',
          displayName: 'B',
          dataType: double,
          style: inputDataPortStyle,
        ),
        ControlOutputPortPrototype(
          idName: 'completed',
          displayName: 'Completed',
          style: controlOutputPortStyle,
        ),
        DataOutputPortPrototype(
          idName: 'result',
          displayName: 'Result',
          dataType: double,
          style: outputDataPortStyle,
        ),
      ],
      fields: [
        FieldPrototype(
          idName: 'operation',
          displayName: 'Operation',
          dataType: Operator,
          defaultData: Operator.add,
          visualizerBuilder: (data) => Text(
            data.toString().split('.').last,
            style: const TextStyle(color: Colors.white),
          ),
          editorBuilder: (context, removeOverlay, data, setData) =>
              SegmentedButton<Operator>(
                segments: const [
                  ButtonSegment(value: Operator.add, label: Text('Add')),
                  ButtonSegment(
                    value: Operator.subtract,
                    label: Text('Subtract'),
                  ),
                  ButtonSegment(
                    value: Operator.multiply,
                    label: Text('Multiply'),
                  ),
                  ButtonSegment(value: Operator.divide, label: Text('Divide')),
                ],
                selected: {data as Operator},
                onSelectionChanged: (newSelection) {
                  setData(newSelection.first, eventType: FieldEventType.submit);
                  removeOverlay();
                },
                direction: Axis.horizontal,
              ),
        ),
      ],
      onExecute: (ports, fields, state, f, p) async {
        final a = ports['a']! as double;
        final b = ports['b']! as double;
        final op = fields['operation']! as Operator;

        switch (op) {
          case Operator.add:
            p({('result', a + b)});
          case Operator.subtract:
            p({('result', a - b)});
          case Operator.multiply:
            p({('result', a * b)});
          case Operator.divide:
            p({('result', b == 0 ? 0 : a / b)});
        }

        unawaited(f({('completed')}));
      },
    ),
  );
}

import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
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
  Function(
    dynamic data,
    Function(dynamic data) setData,
  )? onVisualizerTap,
  Widget Function(
    BuildContext context,
    Function() removeOverlay,
    dynamic data,
    Function(dynamic data, {required FieldEventType eventType}) setData,
  )? editorBuilder,
}) {
  return NodePrototype(
    idName: idName,
    displayName: displayName,
    description: 'Holds a constant $T value.',
    styleBuilder: (state) => FlNodeStyle(
      decoration: defaultNodeStyle(state).decoration,
      headerStyleBuilder: (state) => defaultNodeHeaderStyle(state).copyWith(
        decoration: BoxDecoration(
          color: Colors.orange,
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
    createValueNode<double>(
      idName: 'numericValue',
      displayName: 'Numeric Value',
      defaultValue: 0.0,
      visualizerBuilder: (data) => Text(
        data.toString(),
        style: const TextStyle(color: Colors.white),
      ),
      editorBuilder: (context, removeOverlay, data, setData) => ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 100),
        child: TextFormField(
          initialValue: data.toString(),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            setData(
              double.tryParse(value) ?? 0.0,
              eventType: FieldEventType.change,
            );
          },
          onFieldSubmitted: (value) {
            setData(
              double.tryParse(value) ?? 0.0,
              eventType: FieldEventType.submit,
            );
            removeOverlay();
          },
        ),
      ),
    ),
  );

  controller.registerNodePrototype(
    createValueNode<bool>(
      idName: 'boolValue',
      displayName: 'Boolean Value',
      defaultValue: false,
      visualizerBuilder: (data) => Icon(
        data ? Icons.check : Icons.close,
        color: Colors.white,
        size: 18,
      ),
      onVisualizerTap: (data, setData) => setData(!data),
    ),
  );

  controller.registerNodePrototype(
    createValueNode<String>(
      idName: 'stringValue',
      displayName: 'String Value',
      defaultValue: '',
      visualizerBuilder: (data) => Text(
        '"$data"',
        style: const TextStyle(color: Colors.white),
      ),
      editorBuilder: (context, removeOverlay, data, setData) => ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 200),
        child: TextFormField(
          initialValue: data,
          onChanged: (value) {
            setData(
              value,
              eventType: FieldEventType.change,
            );
          },
          onFieldSubmitted: (value) {
            setData(
              value,
              eventType: FieldEventType.submit,
            );
            removeOverlay();
          },
        ),
      ),
    ),
  );

  controller.registerNodePrototype(
    createValueNode<List<int>>(
      idName: 'numericListValue',
      displayName: 'Numeric List Value',
      defaultValue: [],
      visualizerBuilder: (data) => Text(
        data.length > 3
            ? '[${data.take(3).join(', ')}...]'
            : '[${data.join(', ')}]',
        style: const TextStyle(color: Colors.white),
      ),
      editorBuilder: (context, removeOverlay, data, setData) => ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 200),
        child: TextFormField(
          initialValue: data.join(', '),
          onChanged: (value) {
            setData(
              value.split(',').map((e) => int.tryParse(e.trim()) ?? 0).toList(),
              eventType: FieldEventType.change,
            );
          },
          onFieldSubmitted: (value) {
            setData(
              value.split(',').map((e) => int.tryParse(e.trim()) ?? 0).toList(),
              eventType: FieldEventType.submit,
            );
            removeOverlay();
          },
        ),
      ),
    ),
  );

  controller.registerNodePrototype(
    createValueNode<List<bool>>(
      idName: 'boolListValue',
      displayName: 'Boolean List Value',
      defaultValue: [],
      visualizerBuilder: (data) => Text(
        data.length > 3
            ? '[${data.take(3).map((e) => e ? 'true' : 'false').join(', ')}...]'
            : '[${data.map((e) => e ? 'true' : 'false').join(', ')}]',
        style: const TextStyle(color: Colors.white),
      ),
      editorBuilder: (context, removeOverlay, data, setData) => ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 200),
        child: TextFormField(
          initialValue: data.map((e) => e ? 'true' : 'false').join(', '),
          onChanged: (value) {
            setData(
              value.split(',').map((e) => e.trim() == 'true').toList(),
              eventType: FieldEventType.change,
            );
          },
          onFieldSubmitted: (value) {
            setData(
              value.split(',').map((e) => e.trim() == 'true').toList(),
              eventType: FieldEventType.submit,
            );
            removeOverlay();
          },
        ),
      ),
    ),
  );

  String formatStringList(List<String> data) {
    if (data.isEmpty) return '[]';
    return '[${data.length > 3 ? '${data.take(3).join(', ')}...' : data.join(', ')}]';
  }

  String serializeStringList(List<String> data) {
    return data.map((e) => '"$e"').join(', ');
  }

  List<String> parseStringList(String input) {
    final regex = RegExp(r'"(.*?)"');
    return regex.allMatches(input).map((e) => e.group(1)!).toList();
  }

  controller.registerNodePrototype(
    createValueNode<List<String>>(
      idName: 'stringListValue',
      displayName: 'String List Value',
      defaultValue: [],
      visualizerBuilder: (data) => Text(
        formatStringList(data),
        style: const TextStyle(color: Colors.white),
      ),
      editorBuilder: (context, removeOverlay, data, setData) => ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 200),
        child: TextFormField(
          initialValue: serializeStringList(data),
          onChanged: (value) => setData(
            parseStringList(value),
            eventType: FieldEventType.change,
          ),
          onFieldSubmitted: (value) {
            setData(
              parseStringList(value),
              eventType: FieldEventType.submit,
            );
            removeOverlay();
          },
        ),
      ),
    ),
  );

  controller.registerNodePrototype(
    NodePrototype(
      idName: 'operator',
      displayName: 'Operator',
      description: 'Applies a chosen operation to two numbers.',
      styleBuilder: (state) => FlNodeStyle(
        decoration: defaultNodeStyle(state).decoration,
        headerStyleBuilder: (state) => defaultNodeHeaderStyle(state).copyWith(
          decoration: BoxDecoration(
            color: Colors.pink,
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
              ButtonSegment(value: Operator.subtract, label: Text('Subtract')),
              ButtonSegment(value: Operator.multiply, label: Text('Multiply')),
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

  controller.registerNodePrototype(
    NodePrototype(
      idName: 'random',
      displayName: 'Random',
      description: 'Outputs a random number between 0 and 1.',
      styleBuilder: (state) => FlNodeStyle(
        decoration: defaultNodeStyle(state).decoration,
        headerStyleBuilder: (state) => defaultNodeHeaderStyle(state).copyWith(
          decoration: BoxDecoration(
            color: Colors.purple,
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
        ControlOutputPortPrototype(
          idName: 'completed',
          displayName: 'Completed',
          style: controlOutputPortStyle,
        ),
        DataOutputPortPrototype(
          idName: 'value',
          displayName: 'Value',
          dataType: double,
          style: outputDataPortStyle,
        ),
      ],
      onExecute: (ports, fields, state, f, p) async {
        p({('value', Random().nextDouble())});

        unawaited(f({('completed')}));
      },
    ),
  );

  controller.registerNodePrototype(
    NodePrototype(
      idName: 'if',
      displayName: 'If',
      description: 'Executes a branch based on a condition.',
      styleBuilder: (state) => FlNodeStyle(
        decoration: defaultNodeStyle(state).decoration,
        headerStyleBuilder: (state) => defaultNodeHeaderStyle(state).copyWith(
          decoration: BoxDecoration(
            color: Colors.green,
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
          idName: 'condition',
          displayName: 'Condition',
          dataType: bool,
          style: inputDataPortStyle,
        ),
        ControlOutputPortPrototype(
          idName: 'trueBranch',
          displayName: 'True',
          style: controlOutputPortStyle,
        ),
        ControlOutputPortPrototype(
          idName: 'falseBranch',
          displayName: 'False',
          style: controlOutputPortStyle,
        ),
      ],
      onExecute: (ports, fields, state, f, p) async {
        final condition = ports['condition']! as bool;

        condition
            ? unawaited(f({('trueBranch')}))
            : unawaited(f({('falseBranch')}));
      },
    ),
  );

  controller.registerNodePrototype(
    NodePrototype(
      idName: 'comparator',
      displayName: 'Comparator',
      description: 'Compares two numbers based on a chosen comparator.',
      styleBuilder: (state) => FlNodeStyle(
        decoration: defaultNodeStyle(state).decoration,
        headerStyleBuilder: (state) => defaultNodeHeaderStyle(state).copyWith(
          decoration: BoxDecoration(
            color: Colors.cyan,
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
          dataType: dynamic,
          style: inputDataPortStyle,
        ),
        DataInputPortPrototype(
          idName: 'b',
          displayName: 'B',
          dataType: dynamic,
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
          dataType: bool,
          style: outputDataPortStyle,
        ),
      ],
      fields: [
        FieldPrototype(
          idName: 'comparator',
          displayName: 'Comparator',
          dataType: Comparator,
          defaultData: Comparator.equal,
          visualizerBuilder: (data) => Text(
            data.toString().split('.').last,
            style: const TextStyle(color: Colors.white),
          ),
          editorBuilder: (context, removeOverlay, data, setData) =>
              SegmentedButton<Comparator>(
            segments: const [
              ButtonSegment(value: Comparator.equal, label: Text('==')),
              ButtonSegment(value: Comparator.notEqual, label: Text('!=')),
              ButtonSegment(value: Comparator.greater, label: Text('>')),
              ButtonSegment(value: Comparator.greaterEqual, label: Text('>=')),
              ButtonSegment(value: Comparator.less, label: Text('<')),
              ButtonSegment(value: Comparator.lessEqual, label: Text('<=')),
            ],
            selected: {data as Comparator},
            onSelectionChanged: (newSelection) {
              setData(newSelection.first, eventType: FieldEventType.submit);
              removeOverlay();
            },
            direction: Axis.horizontal,
          ),
        ),
      ],
      onExecute: (ports, fields, state, f, p) async {
        final a = ports['a']! as dynamic;
        final b = ports['b']! as dynamic;
        final comp = fields['comparator']! as Comparator;

        switch (comp) {
          case Comparator.equal:
            p({('result', a == b)});
          case Comparator.notEqual:
            p({('result', a != b)});
          case Comparator.greater:
            p({('result', a > b)});
          case Comparator.greaterEqual:
            p({('result', a >= b)});
          case Comparator.less:
            p({('result', a < b)});
          case Comparator.lessEqual:
            p({('result', a <= b)});
        }

        unawaited(f({('completed')}));
      },
    ),
  );

  controller.registerNodePrototype(
    NodePrototype(
      idName: 'print',
      displayName: 'Print',
      description: 'Prints a value to the console.',
      styleBuilder: (state) => FlNodeStyle(
        decoration: defaultNodeStyle(state).decoration,
        headerStyleBuilder: (state) => defaultNodeHeaderStyle(state).copyWith(
          decoration: BoxDecoration(
            color: Colors.deepPurple,
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
          idName: 'value',
          displayName: 'Value',
          dataType: dynamic,
          style: inputDataPortStyle,
        ),
        ControlOutputPortPrototype(
          idName: 'completed',
          displayName: 'Completed',
          style: controlOutputPortStyle,
        ),
      ],
      onExecute: (ports, fields, state, f, p) async {
        if (kDebugMode) {
          print(ports['value']);
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Value: ${ports['value']}'),
          ),
        );

        unawaited(f({('completed')}));
      },
    ),
  );

  controller.registerNodePrototype(
    NodePrototype(
      idName: 'round',
      displayName: 'Round',
      description: 'Rounds a number to a specified number of decimals.',
      styleBuilder: (state) => FlNodeStyle(
        decoration: defaultNodeStyle(state).decoration,
        headerStyleBuilder: (state) => defaultNodeHeaderStyle(state).copyWith(
          decoration: BoxDecoration(
            color: Colors.blue,
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
          idName: 'value',
          displayName: 'Value',
          dataType: double,
          style: inputDataPortStyle,
        ),
        ControlOutputPortPrototype(
          idName: 'completed',
          displayName: 'Completed',
          style: controlOutputPortStyle,
        ),
        DataOutputPortPrototype(
          idName: 'rounded',
          displayName: 'Rounded',
          dataType: int,
          style: outputDataPortStyle,
        ),
      ],
      fields: [
        FieldPrototype(
          idName: 'decimals',
          displayName: 'Decimals',
          dataType: int,
          defaultData: 2,
          visualizerBuilder: (data) => Text(
            data.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          editorBuilder: (context, removeOverlay, data, setData) =>
              ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 100),
            child: TextFormField(
              initialValue: data.toString(),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setData(
                  int.tryParse(value) ?? 0,
                  eventType: FieldEventType.change,
                );
              },
              onFieldSubmitted: (value) {
                setData(
                  int.tryParse(value) ?? 0,
                  eventType: FieldEventType.submit,
                );
                removeOverlay();
              },
            ),
          ),
        ),
      ],
      onExecute: (ports, fields, state, f, p) async {
        final double value = ports['value']! as double;
        final int decimals = fields['decimals']! as int;

        p({('rounded', double.parse(value.toStringAsFixed(decimals)))});

        unawaited(f({('completed')}));
      },
    ),
  );

  controller.registerNodePrototype(
    NodePrototype(
      idName: 'forEachLoop',
      displayName: 'For Each Loop',
      description: 'Executes a loop for a specified number of iterations.',
      styleBuilder: (state) => FlNodeStyle(
        decoration: defaultNodeStyle(state).decoration,
        headerStyleBuilder: (state) => defaultNodeHeaderStyle(state).copyWith(
          decoration: BoxDecoration(
            color: Colors.teal,
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
          idName: 'list',
          displayName: 'List',
          dataType: dynamic,
          style: inputDataPortStyle,
        ),
        ControlOutputPortPrototype(
          idName: 'loopBody',
          displayName: 'Loop Body',
          style: controlOutputPortStyle,
        ),
        ControlOutputPortPrototype(
          idName: 'completed',
          displayName: 'Completed',
          style: controlOutputPortStyle,
        ),
        DataOutputPortPrototype(
          idName: 'listElem',
          displayName: 'List Element',
          dataType: dynamic,
          style: outputDataPortStyle,
        ),
        DataOutputPortPrototype(
          idName: 'listIdx',
          displayName: 'List Index',
          dataType: int,
          style: outputDataPortStyle,
        ),
      ],
      onExecute: (ports, fields, state, f, p) async {
        final List<dynamic> list = ports['list']! as List<dynamic>;

        late int i;

        if (!state.containsKey('iteration')) {
          i = state['iteration'] = 0;
        } else {
          i = state['iteration'] as int;
        }

        if (i < list.length) {
          p({('listElem', list[i]), ('listIdx', i)});
          state['iteration'] = ++i;
          await f({'loopBody'});
        } else {
          unawaited(f({('completed')}));
        }
      },
    ),
  );
}

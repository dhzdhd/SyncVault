import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fl_nodes/fl_nodes.dart';

class HierarchyWidget extends StatefulWidget {
  final FlNodeEditorController controller;
  final bool isCollapsed;

  const HierarchyWidget({
    required this.controller,
    required this.isCollapsed,
    super.key,
  });

  @override
  State<HierarchyWidget> createState() => _HierarchyWidgetState();
}

class _HierarchyWidgetState extends State<HierarchyWidget> {
  @override
  void initState() {
    super.initState();
    _subscribeToControllerEvents();
  }

  void _subscribeToControllerEvents() {
    widget.controller.eventBus.events.listen((event) {
      if (event is SelectionEvent ||
          event is DragSelectionEvent ||
          event is AddNodeEvent ||
          event is RemoveNodeEvent) {
        if (mounted) {
          setState(() {});
        }
      }
    });
  }

  void _onNodeTap(NodeInstance node) {
    widget.controller.selectNodesById({
      node.id,
    }, holdSelection: HardwareKeyboard.instance.isControlPressed);
    widget.controller.focusNodesById(widget.controller.selectedNodeIds.toSet());
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: widget.isCollapsed ? 0 : 300,
      color: const Color.fromRGBO(33, 33, 33, 1),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!widget.isCollapsed)
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.controller.nodesAsList.length,
                itemBuilder: (context, index) {
                  final reversedIdx =
                      widget.controller.nodesAsList.length - index - 1;
                  final node = widget.controller.nodesAsList[reversedIdx];

                  final isSelected = node.state.isSelected;
                  final backgroundColor = isSelected
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Theme.of(context).colorScheme.surface;

                  return Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: ListTile(
                        title: Text(
                          node.prototype.displayName,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          'x: ${node.offset.dx.toStringAsFixed(2)} y: ${node.offset.dy.toStringAsFixed(2)}',
                        ),
                        onTap: () => _onNodeTap(node),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

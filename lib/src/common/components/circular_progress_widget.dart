import 'package:flutter/material.dart';

class CircularProgressWidget extends StatefulWidget {
  const CircularProgressWidget({
    super.key,
    required this.size,
    required this.isInfinite,
  });

  final double size;
  final bool isInfinite;

  @override
  State<CircularProgressWidget> createState() => _CircularProgressWidgetState();
}

class _CircularProgressWidgetState extends State<CircularProgressWidget>
    with TickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..addListener(() {
            setState(() {});
          });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: widget.isInfinite ? null : controller.value,
            strokeWidth: 3.0,
          ),
          Visibility(
            visible: !widget.isInfinite,
            child: Text(
              '${(controller.value * 100).toInt()}%',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

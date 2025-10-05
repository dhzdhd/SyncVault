import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart' hide State;

class CircularProgressWidget extends StatefulWidget {
  const CircularProgressWidget({
    super.key,
    required this.size,
    this.progress = const None(),
  });

  final double size;
  final Option<double> progress;

  @override
  State<CircularProgressWidget> createState() => _CircularProgressWidgetState();
}

class _CircularProgressWidgetState extends State<CircularProgressWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: widget.progress.map((val) => val / 100).toNullable(),
            strokeWidth: 3.0,
          ),
          Visibility(
            visible: widget.progress.isSome(),
            child: Text(
              widget.progress.toNullable()!.toInt().toString(),
              style: TextStyle(
                fontSize: widget.size / 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

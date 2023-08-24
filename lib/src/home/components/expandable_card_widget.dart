import 'package:flutter/material.dart';
import 'package:syncvault/src/settings/controllers/theme_controller.dart';

class ExpandableCardWidget extends StatefulWidget {
  const ExpandableCardWidget({
    Key? key,
    required this.title,
    required this.trailing,
    required this.child,
  }) : super(key: key);

  final Widget title;
  final Widget trailing;
  final Widget child;

  @override
  State<ExpandableCardWidget> createState() => _ExpandableCardWidgetState();
}

class _ExpandableCardWidgetState extends State<ExpandableCardWidget> {
  bool _show = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      alignment: Alignment.topCenter,
      curve: Curves.easeInOut,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Ink(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
            onTap: () {
              setState(() {
                _show = !_show;
              });
            },
            child: Card(
              margin: const EdgeInsets.all(0),
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        widget.title,
                        const Spacer(),
                        widget.trailing,
                        AnimatedRotation(
                          turns: _show ? 0.25 : 0,
                          duration: const Duration(milliseconds: 200),
                          child: const Icon(Icons.keyboard_arrow_right),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: _show,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: AnimatedOpacity(
                          opacity: _show ? 1 : 0,
                          duration: const Duration(milliseconds: 200),
                          child: widget.child,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

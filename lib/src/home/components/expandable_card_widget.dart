import 'package:flutter/material.dart';

class ExpandableCardWidget extends StatefulWidget {
  const ExpandableCardWidget({
    Key? key,
    required this.leading,
    required this.trailing,
  }) : super(key: key);

  final Widget leading;
  final Widget trailing;

  @override
  State<ExpandableCardWidget> createState() => _ExpandableCardWidgetState();
}

class _ExpandableCardWidgetState extends State<ExpandableCardWidget> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 1000),
      alignment: Alignment.topCenter,
      curve: Curves.easeInOut,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            setState(() {
              show = !show;
            });
          },
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 37, 35, 42),
            ),
            child: Card(
              margin: const EdgeInsets.all(0),
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.leading,
                    Visibility(
                      visible: show,
                      child: AnimatedOpacity(
                        opacity: show ? 1 : 0,
                        duration: const Duration(milliseconds: 200),
                        child: TextButton(
                          onPressed: () {},
                          child: widget.trailing,
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

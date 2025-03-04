import 'package:flutter/material.dart';

class SliverAnimatedAppBar extends StatelessWidget {
  const SliverAnimatedAppBar({
    super.key,
    required this.title,
    this.canExpand = true,
  });

  final String title;
  final bool canExpand;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      stretch: true,
      pinned: true,
      snap: true,
      expandedHeight: canExpand ? 160.0 : kToolbarHeight,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final top = constraints.biggest.height;
          const expandedHeight = 160.0;
          final collapsedHeight =
              kToolbarHeight + MediaQuery.of(context).padding.top;
          final expansionProgress =
              ((top - collapsedHeight) / (expandedHeight - collapsedHeight))
                  .clamp(0.0, 1.0);

          final leftPadding = 56.0 - (30.0 * expansionProgress);

          return FlexibleSpaceBar(
            expandedTitleScale: canExpand ? 1.75 : 1,
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            titlePadding: EdgeInsets.only(
                left: canExpand ? leftPadding : 56.0, bottom: 14.0),
            centerTitle: false,
          );
        },
      ),
    );
  }
}

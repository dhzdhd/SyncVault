import 'package:flutter/material.dart';

class SliverAnimatedAppBar extends StatelessWidget {
  const SliverAnimatedAppBar({
    super.key,
    required this.title,
    this.canExpand = true,
    this.hasLeading = true,
    this.actions = const [],
  });

  final String title;
  final bool canExpand;
  final bool hasLeading;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Theme.of(context).secondaryHeaderColor,
      floating: true,
      stretch: true,
      pinned: true,
      snap: true,
      expandedHeight: canExpand ? 160.0 : kToolbarHeight,
      actions: actions,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final top = constraints.biggest.height;
          const expandedHeight = 160.0;
          final collapsedHeight =
              kToolbarHeight + MediaQuery.of(context).padding.top;
          final expansionProgress = ((top - collapsedHeight) /
                  (expandedHeight - collapsedHeight))
              .clamp(0.0, 1.0);

          final leftPadding =
              hasLeading ? 56.0 - (30.0 * expansionProgress) : 56.0 - 30.0;

          return FlexibleSpaceBar(
            expandedTitleScale: canExpand ? 1.75 : 1,
            background: const SizedBox(),
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            titlePadding: EdgeInsets.only(
              left:
                  canExpand
                      ? leftPadding
                      : hasLeading
                      ? 56.0
                      : 56.0 - 30.0,
              bottom: 14.0,
            ),
            centerTitle: false,
          );
        },
      ),
    );
  }
}

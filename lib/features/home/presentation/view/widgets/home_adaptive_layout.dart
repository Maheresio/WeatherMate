import 'package:flutter/material.dart';

class HomeAdaptiveLayout extends StatelessWidget {
  const HomeAdaptiveLayout(
      {super.key,
      required this.mobileLayout,
      required this.tabletLayout,
      required this.desktopLayout});

  final WidgetBuilder mobileLayout, tabletLayout, desktopLayout;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 800) {
        return mobileLayout(context);
      } else if (constraints.maxWidth < 1400) {
        return tabletLayout(context);
      } else {
        return desktopLayout(context);
      }
    });
  }
}

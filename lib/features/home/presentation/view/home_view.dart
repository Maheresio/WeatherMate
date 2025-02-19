import 'package:flutter/material.dart';
import 'package:weather_mate/features/home/presentation/view/widgets/home_adaptive_layout.dart';
import 'package:weather_mate/features/home/presentation/view/widgets/home_desktop_view_body.dart';
import 'package:weather_mate/features/home/presentation/view/widgets/home_mobile_view_body.dart';
import 'package:weather_mate/features/home/presentation/view/widgets/home_tablet_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeAdaptiveLayout(
        mobileLayout: (context) => HomeMobileViewBody(),
        tabletLayout: (context) => HomeTabletViewBody(),
        desktopLayout: (context) => HomeDesktopViewBody(),
      ),
    );
  }
}

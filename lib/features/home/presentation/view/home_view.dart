import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import 'home_desktop_view_body.dart';
import 'home_mobile_view_body.dart';
import 'home_tablet_view_body.dart';
import 'widgets/home_adaptive_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: HomeAdaptiveLayout(
        mobileLayout: (context) => const HomeMobileViewBody(),
        tabletLayout: (context) => const HomeTabletViewBody(),
        desktopLayout: (context) => const HomeDesktopViewBody(),
      ),
    );
  }
}

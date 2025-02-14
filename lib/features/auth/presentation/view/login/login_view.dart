import 'package:flutter/material.dart';

import '../components/adaptive_layout.dart';
import 'widgets/desktop_login_view_body.dart';
import 'widgets/mobile_login_view_body.dart';
import 'widgets/tablet_login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => MobileLoginViewBody(),
        tabletLayout: (context) => TabletLoginViewBody(),
        desktopLayout: (context) => DesktopLoginViewBody(),
      ),
    );
  }
}

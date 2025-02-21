import 'package:flutter/material.dart';

import '../components/auth_adaptive_layout.dart';
import 'widgets/desktop_login_view_body.dart';
import 'widgets/mobile_login_view_body.dart';
import 'widgets/tablet_login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthAdaptiveLayout(
        mobileLayout: (context) => const MobileLoginViewBody(),
        tabletLayout: (context) => const TabletLoginViewBody(),
        desktopLayout: (context) => const DesktopLoginViewBody(),
      ),
    );
  }
}

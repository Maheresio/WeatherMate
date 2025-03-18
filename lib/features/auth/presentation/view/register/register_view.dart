import 'package:flutter/material.dart';

import '../components/auth_adaptive_layout.dart';
import 'widgets/desktop_register_view_body.dart';
import 'widgets/mobile_register_view_body.dart';
import 'widgets/tablet_register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthAdaptiveLayout(
        mobileLayout: (context) => const MobileRegisterViewBody(),
        tabletLayout: (context) => const TabletRegisterViewBody(),
        desktopLayout: (context) => const DesktopRegisterViewBody(),
      ),
    );
  }
}

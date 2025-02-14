import 'package:flutter/material.dart';
import '../components/adaptive_layout.dart';
import 'widgets/desktop_register_view_body.dart';
import 'widgets/mobile_register_view_body.dart';
import 'widgets/tablet_register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => MobileRegisterViewBody(),
        tabletLayout: (context) => TabletRegisterViewBody(),
        desktopLayout: (context) => DesktopRegisterViewBody(),
      ),
    );
  }
}

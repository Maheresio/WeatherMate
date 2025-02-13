import 'package:flutter/material.dart';
import 'package:weather_mate/features/auth/presentation/view/desktop_login_view_body.dart';
import 'package:weather_mate/features/auth/presentation/view/mobile_login_view_body.dart';
import 'package:weather_mate/features/auth/presentation/view/tablet_login_view_body.dart';
import 'package:weather_mate/features/auth/presentation/view/widgets/adaptive_layout.dart';

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

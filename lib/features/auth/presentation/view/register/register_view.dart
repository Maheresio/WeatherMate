import 'package:flutter/material.dart';
import 'package:weather_mate/features/auth/presentation/view/components/adaptive_layout.dart';
import 'package:weather_mate/features/auth/presentation/view/register/widgets/desktop_register_view_body.dart';
import 'package:weather_mate/features/auth/presentation/view/register/widgets/mobile_register_view_body.dart';
import 'package:weather_mate/features/auth/presentation/view/register/widgets/tablet_register_view_body.dart';

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

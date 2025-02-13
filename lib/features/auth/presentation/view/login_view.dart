import 'package:flutter/material.dart';
import 'package:weather_mate/features/auth/presentation/view/desktop_login_view_body.dart';
import 'package:weather_mate/features/auth/presentation/view/mobile_login_view_body.dart';
import 'package:weather_mate/features/auth/presentation/view/tablet_login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return MobileLoginViewBody();
            } else if (constraints.maxWidth < 1200) {
              return TabletLoginViewBody();
            } else {
              return DesktopLoginViewBody();
            }
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather_mate/core/utils/app_colors.dart';
import 'package:weather_mate/features/splash/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SplashViewBody(),
    );
  }
}

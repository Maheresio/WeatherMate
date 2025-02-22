import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../components/auth_card.dart';

class RegisterCard extends StatelessWidget {
  const RegisterCard({
    super.key,
    required this.borderRadius,
    this.titleStyle,
    this.subtitleStyle,
  });
  final BorderRadiusGeometry borderRadius;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  @override
  Widget build(BuildContext context) {
    return AuthCard(
      title: AppStrings.welcomeBack,
      subtitle: AppStrings.alreadyHaveAccount,
      buttonText: AppStrings.login,
      titleStyle: titleStyle ?? AppStyles.textStyleBold35(context),
      subtitleStyle: subtitleStyle ??
          AppStyles.textStyle13(context).copyWith(
            color: Colors.white,
          ),
      onPressed: () {
        GoRouter.of(context).go(AppRouter.kLogin);
      },
      borderRadius: borderRadius,
    );
  }
}

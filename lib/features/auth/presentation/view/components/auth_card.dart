import 'package:flutter/material.dart';
import 'package:weather_mate/core/utils/app_colors.dart';
import 'package:weather_mate/core/utils/app_constants.dart';
import 'package:weather_mate/core/utils/app_styles.dart';

import '../../../../../core/utils/app_strings.dart';

class AuthCard extends StatelessWidget {
  const AuthCard({
    super.key,
    required this.titleStyle,
    required this.subtitleStyle,
    required this.onPressed,
    this.borderRadius,
    required this.title,
    required this.subtitle,
    this.buttonText = AppStrings.register,
  });

  final TextStyle titleStyle;
  final TextStyle subtitleStyle;
  final void Function() onPressed;
  final BorderRadiusGeometry? borderRadius;
  final String title;
  final String subtitle;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: borderRadius ?? BorderRadius.zero,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Column(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: titleStyle,
            ),
            Text(
              subtitle,
              style: subtitleStyle,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth > 600 ? screenWidth * .08 : 20,
                  vertical: screenWidth > 600 ? 20 : 15,
                ),
                backgroundColor: AppColors.primaryColor,
                side: BorderSide(color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppConstants.radius5,
                  ),
                ),
              ),
              onPressed: onPressed,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  buttonText,
                  style: AppStyles.textStyleBold18(context).copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

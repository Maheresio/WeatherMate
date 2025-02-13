import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_mate/core/utils/app_constants.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import 'styled_icon_button.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppConstants.heightSize10,
      children: [
        Text(
          AppStrings.loginWithSocialPlatforms,
          style: AppStyles.textStyle13,
        ),
        Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          runSpacing: 5.h,
          children: [
            StyledIconButton(image: AppImages.google),
            StyledIconButton(image: AppImages.facebook),
            StyledIconButton(image: AppImages.github),
            StyledIconButton(image: AppImages.linkedin),
          ],
        )
      ],
    );
  }
}

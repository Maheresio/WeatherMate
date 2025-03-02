import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import 'styled_icon_button.dart';

class SocialAuthSection extends StatelessWidget {
  const SocialAuthSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        Text(
          AppStrings.loginWithSocialPlatforms,
          style: AppStyles.textStyleNormal20(context),
        ),
        const Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          runSpacing: 5,
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

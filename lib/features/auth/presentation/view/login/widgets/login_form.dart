import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../components/auth_button.dart';
import 'login_fields.dart';
import '../../components/social_auth_section.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        Text(
          AppStrings.login,
          style: AppStyles.textStyleBold55(context),
        ),
        LoginFields(),
        Text(
          AppStrings.forgotPassword,
          style: AppStyles.textStyleNormal20(context),
        ),
        AuthButton(
          buttonText: AppStrings.login,
          onPressed: () {},
        ),
        SocialAuthSection(),
      ],
    );
  }
}

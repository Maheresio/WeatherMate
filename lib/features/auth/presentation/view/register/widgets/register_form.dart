import 'package:flutter/material.dart';
import 'package:weather_mate/features/auth/presentation/view/register/widgets/register_fields.dart';

import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../components/auth_button.dart';
import '../../components/social_auth_section.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          AppStrings.registration,
          style: AppStyles.textStyleBold55(context),
        ),
        RegisterFields(),
        SizedBox(
          height: 5,
        ),
        AuthButton(
          buttonText: AppStrings.register,
          onPressed: () {},
        ),
        SocialAuthSection(),
      ],
    );
  }
}

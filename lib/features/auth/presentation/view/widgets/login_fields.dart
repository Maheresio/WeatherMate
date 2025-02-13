import 'package:flutter/material.dart';

import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import 'styled_text_form_field.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppConstants.heightSize10,
      children: [
        StyledTextFormField(
          labelText: AppStrings.username,
          suffixIcon: Icons.person,
          onTap: () {},
          controller: TextEditingController(),
        ),
        StyledTextFormField(
          labelText: AppStrings.password,
          suffixIcon: Icons.lock,
          onTap: () {},
          controller: TextEditingController(),
        ),
        Text(
          AppStrings.forgotPassword,
          style: AppStyles.textStyle13,
        ),
      ],
    );
  }
}

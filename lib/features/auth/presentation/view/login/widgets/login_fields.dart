import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_strings.dart';
import '../../components/styled_text_form_field.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        StyledTextFormField(
          labelText: AppStrings.username,
          suffixIcon: Icons.person,
          controller: TextEditingController(),
        ),
        StyledTextFormField(
          labelText: AppStrings.password,
          suffixIcon: Icons.lock,
          controller: TextEditingController(),
        ),
      ],
    );
  }
}

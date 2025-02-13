import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_strings.dart';
import '../../components/styled_text_form_field.dart';

class RegisterFields extends StatelessWidget {
  const RegisterFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        SizedBox(
          height: 10,
        ),
        StyledTextFormField(
          labelText: AppStrings.username,
          suffixIcon: Icons.person,
          onTap: () {},
          controller: TextEditingController(),
        ),
        StyledTextFormField(
          labelText: AppStrings.email,
          suffixIcon: Icons.email_rounded,
          onTap: () {},
          controller: TextEditingController(),
        ),
        StyledTextFormField(
          labelText: AppStrings.password,
          suffixIcon: Icons.lock,
          onTap: () {},
          controller: TextEditingController(),
        ),
      ],
    );
  }
}

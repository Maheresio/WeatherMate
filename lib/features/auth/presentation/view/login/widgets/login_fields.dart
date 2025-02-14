import 'package:flutter/material.dart';

import '../../../../../../core/helpers/validation_methods.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../components/styled_text_form_field.dart';

class LoginFields extends StatelessWidget {
  const LoginFields(
      {super.key,
      required this.emailController,
      required this.passwordController});

  final TextEditingController emailController;
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        StyledTextFormField(
          labelText: AppStrings.email,
          suffixIcon: Icons.email_rounded,
          controller: emailController,
          validator: (value) => emailValidator(value),
        ),
        StyledTextFormField(
          labelText: AppStrings.password,
          suffixIcon: Icons.lock,
          controller: passwordController,
          validator: (value) => passwordValidator(value),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../../core/helpers/validation_methods.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../components/styled_text_form_field.dart';

class RegisterFields extends StatelessWidget {
  const RegisterFields(
      {super.key,
      required this.usernameController,
      required this.emailController,
      required this.passwordController});

  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        const SizedBox(
          height: 10,
        ),
        StyledTextFormField(
          validator: (value) => usernameValidator(value),
          labelText: AppStrings.username,
          suffixIcon: Icons.person,
          controller: usernameController,
        ),
        StyledTextFormField(
          validator: (value) => emailValidator(value),
          labelText: AppStrings.email,
          suffixIcon: Icons.email_rounded,
          controller: emailController,
        ),
        StyledTextFormField(
          validator: (value) => passwordValidator(value),
          labelText: AppStrings.password,
          suffixIcon: Icons.lock,
          controller: passwordController,
        ),
      ],
    );
  }
}

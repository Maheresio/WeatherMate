import 'package:flutter/material.dart';
import 'package:weather_mate/core/utils/app_constants.dart';

class StyledTextFormField extends StatelessWidget {
  const StyledTextFormField({
    super.key,
    required this.labelText,
    required this.suffixIcon,
    required this.controller,
    this.validator,
  });

  final String labelText;
  final IconData suffixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          labelText: labelText,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(suffixIcon),
          ),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.radius10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an email';
  }
  final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zAZ0-9.-]+\.[a-zA-Z]{2,}$');
  if (!emailRegex.hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  }
  if (value.length < 8) {
    return 'Password must be at least 8 characters long';
  }
  final passwordRegex =
      RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$');
  if (!passwordRegex.hasMatch(value)) {
    return 'Password must contain at least one uppercase letter, one lowercase letter, and one number';
  }
  return null;
}

String? usernameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a username';
  }
  if (value.length < 3) {
    return 'Username must be at least 3 characters long';
  }
  if (value.length > 20) {
    return 'Username must not exceed 20 characters';
  }
  final usernameRegex = RegExp(r'^[a-zA-Z0-9_]+$');
  if (!usernameRegex.hasMatch(value)) {
    return 'Username can only contain letters, numbers, and underscores';
  }
  return null;
}

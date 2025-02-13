import 'package:flutter/material.dart';
import 'package:weather_mate/core/utils/app_constants.dart';

class StyledTextFormField extends StatelessWidget {
  const StyledTextFormField({
    super.key,
    required this.labelText,
    required this.suffixIcon,
    this.onTap,
    required this.controller,
  });

  final String labelText;
  final IconData suffixIcon;
  final void Function()? onTap;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: TextFormField(
        controller: controller,
        onTap: onTap,
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

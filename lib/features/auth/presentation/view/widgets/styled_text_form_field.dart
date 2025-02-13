import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SizedBox(
        height: 60.h,
        child: TextFormField(
          controller: controller,
          onTap: onTap,
          decoration: InputDecoration(
            labelText: labelText,
            suffixIcon: Icon(suffixIcon),
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.radius10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

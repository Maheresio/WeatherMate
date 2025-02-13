import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_strings.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.login,
      style: TextStyle(
        color: Colors.black,
        fontSize: 35.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_mate/core/utils/app_constants.dart';
import 'package:weather_mate/core/utils/app_strings.dart';
import 'package:weather_mate/core/utils/app_styles.dart';

import 'widgets/login_button.dart';
import 'widgets/login_header.dart';
import 'widgets/login_fields.dart';
import 'widgets/social_login_section.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 190.h,
          right: 0,
          left: 0,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              spacing: AppConstants.heightSize10,
              children: [
                LoginHeader(),
                LoginFields(),
                LoginButton(
                  onPressed: () {},
                ),
                SocialLoginSection(),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: Container(
            height: 155.h,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(AppConstants.radius100),
                bottomRight: Radius.circular(AppConstants.radius100),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.helloWelcome,
                  style: AppStyles.textStyle30,
                ),
                Text(
                  AppStrings.dontHaveAccount,
                  style: AppStyles.textStyle13.copyWith(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue, // Same color as the parent container
                    side: BorderSide(color: Colors.white), // White border
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(5.r), // Rectangular shape
                    ),
                    minimumSize: Size(135.w, 40.h), // Increased width
                  ),
                  onPressed: () {},
                  child: Text(
                    AppStrings.register,
                    style: TextStyle(color: Colors.white), // White text
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

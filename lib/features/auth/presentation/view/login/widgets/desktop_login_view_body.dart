import 'package:flutter/material.dart';
import 'package:weather_mate/features/auth/presentation/view/login/widgets/login_card.dart';
import 'package:weather_mate/features/auth/presentation/view/login/widgets/login_form.dart';

import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../core/utils/app_styles.dart';

class DesktopLoginViewBody extends StatelessWidget {
  const DesktopLoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: LoginCard(
                      titleStyle: AppStyles.textStyleBold70(context),
                      subtitleStyle: AppStyles.textStyleMedium20(context),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(AppConstants.radius200),
                        bottomRight: Radius.circular(AppConstants.radius200),
                      ),
                    )),
                    Expanded(
                      child: LoginForm(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

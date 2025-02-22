import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../core/utils/app_styles.dart';
import 'register_card.dart';
import 'register_form.dart';

class DesktopRegisterViewBody extends StatelessWidget {
  const DesktopRegisterViewBody({super.key});

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
                    const Expanded(
                      child: RegisterForm(),
                    ),
                    Expanded(
                      child: RegisterCard(
                        titleStyle: AppStyles.textStyleBold70(context),
                        subtitleStyle: AppStyles.textStyleMedium20(context),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppConstants.radius200),
                          bottomLeft: Radius.circular(AppConstants.radius200),
                        ),
                      ),
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

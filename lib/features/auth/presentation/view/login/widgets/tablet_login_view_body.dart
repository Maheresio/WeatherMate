import 'package:flutter/material.dart';

import 'package:weather_mate/features/auth/presentation/view/login/widgets/login_card.dart';

import 'login_form.dart';

class TabletLoginViewBody extends StatelessWidget {
  const TabletLoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.2,
        ),
        child: Column(
          spacing: 80,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LoginCard(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}

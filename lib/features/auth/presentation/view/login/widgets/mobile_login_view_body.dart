import 'package:flutter/material.dart';
import 'package:weather_mate/features/auth/presentation/view/login/widgets/login_form.dart';

import 'login_card.dart';

class MobileLoginViewBody extends StatelessWidget {
  const MobileLoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: LoginCard(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    ),
                    
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: LoginForm(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


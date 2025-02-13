import 'package:flutter/material.dart';
import 'package:weather_mate/features/auth/presentation/view/register/widgets/register_card.dart';
import 'package:weather_mate/features/auth/presentation/view/register/widgets/register_form.dart';

class MobileRegisterViewBody extends StatelessWidget {
  const MobileRegisterViewBody({super.key});

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
                  flex: 3,
                  child: RegisterForm(),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: RegisterCard(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

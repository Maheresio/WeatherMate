import 'package:flutter/material.dart';

import 'login_form.dart';

class TabletLoginViewBody extends StatelessWidget {
  const TabletLoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 500,
        padding: EdgeInsets.all(20),
        child: LoginForm(),
      ),
    );
  }
}

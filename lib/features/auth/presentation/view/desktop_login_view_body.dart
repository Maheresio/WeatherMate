import 'package:flutter/material.dart';

import 'login_form.dart';

class DesktopLoginViewBody extends StatelessWidget {
  const DesktopLoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.blueGrey[50],
            child: Center(
              child: Text(
                "Welcome to Weather App",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: LoginForm(),
          ),
        ),
      ],
    );
  }
}

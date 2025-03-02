import 'package:flutter/material.dart';

import 'core/utils/service_locator.dart';
import 'features/auth/data/auth_repository_impl.dart';
import 'features/auth/presentation/view/login/login_view.dart';
import 'features/home/presentation/view/home_view.dart';

class AuthCheckerView extends StatelessWidget {
  const AuthCheckerView({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepository = getIt<AuthRepositoryImpl>();

    return FutureBuilder<bool>(
      future: authRepository.isUserAuthenticated(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text('An error occurred'),
            ),
          );
        }

        if (snapshot.data == true) {
          return const HomeView();
        }

        return const LoginView();
      },
    );
  }
}

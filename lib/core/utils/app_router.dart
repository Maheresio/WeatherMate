import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_mate/features/auth/presentation/view/login_view.dart';

abstract class AppRouter {
  static const kLogin = '/loginView';

  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginView();
        },
      ),
    ],
  );
}

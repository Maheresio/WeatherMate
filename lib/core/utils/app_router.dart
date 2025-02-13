import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_mate/features/auth/presentation/view/login/login_view.dart';
import 'package:weather_mate/features/auth/presentation/view/register/register_view.dart';

import '../helpers/vertical_and_horizontal_transitions.dart';

abstract class AppRouter {
  static const kLogin = '/loginView';
  static const kRegister = '/registerView';

  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginView();
        },
      ),
      GoRoute(
        path: kRegister,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MediaQuery.sizeOf(context).width < 1400
              ? verticalTransition(
                  state,
                  dy: -1.0,
                  child: RegisterView(),
                )
              : horizontalTransition(
                  state,
                  child: RegisterView(),
                  dx: -1.0,
                );
        },
      ),
      GoRoute(
        path: kLogin,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MediaQuery.sizeOf(context).width < 1400
              ? verticalTransition(
                  state,
                  dy: 1.0,
                  child: LoginView(),
                )
              : horizontalTransition(state, child: LoginView(), dx: 1.0,);
        },
      ),
    ],
  );
}

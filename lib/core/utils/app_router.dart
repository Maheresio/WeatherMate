import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/view/login/login_view.dart';
import '../../features/auth/presentation/view/register/register_view.dart';
import '../../features/home/presentation/view/home_view.dart';
import '../helpers/vertical_and_horizontal_transitions.dart';

abstract class AppRouter {
  static const kLogin = '/loginView';
  static const kRegister = '/registerView';
  static const kHome = '/homeView';

  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: kRegister,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MediaQuery.sizeOf(context).width < 1400
              ? verticalTransition(
                  state,
                  dy: -1.0,
                  child: const RegisterView(),
                )
              : horizontalTransition(
                  state,
                  child: const RegisterView(),
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
                  child: const LoginView(),
                )
              : horizontalTransition(
                  state,
                  child: const LoginView(),
                  dx: 1.0,
                );
        },
      ),
    ],
  );
}

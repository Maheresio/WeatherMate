import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../auth_checker_view.dart';
import '../../features/auth/presentation/view/login/login_view.dart';
import '../../features/auth/presentation/view/register/register_view.dart';
import '../../features/splash/splash_view.dart';
import '../helpers/vertical_and_horizontal_transitions.dart';

abstract class AppRouter {
  static const kInitLogin = '/initLoginView';
  static const kLogin = '/loginView';
  static const kRegister = '/registerView';
  static const kHome = '/homeView';
  static const kCheckAuth = '/checkAuth';

  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kCheckAuth,
        builder: (BuildContext context, GoRouterState state) {
          return const AuthCheckerView();
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
      GoRoute(
        path: kInitLogin,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const LoginView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          );
        },
      ),
    ],
  );
}

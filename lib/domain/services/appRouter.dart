import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_with_flutter/domain/services/routes.dart';
import 'package:go_with_flutter/presentation/view/auth/login/login.dart';
import 'package:go_with_flutter/presentation/view/auth/registration/registration.dart';
import 'package:go_with_flutter/presentation/view/dashboard/dashboard.dart';
import 'package:go_with_flutter/presentation/view/splash/splash.dart';
class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: Routes.splash,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: Routes.login,
            builder: (BuildContext context, GoRouterState state) {
              return const LoginScreen();
            },
          ),
          GoRoute(
            path: Routes.register,
            builder: (BuildContext context, GoRouterState state) {
              return const RegistrationScreen();
            },
          ),
          GoRoute(
            path: Routes.dashboard,
            builder: (BuildContext context, GoRouterState state) {
              return const Dashboard();
            },
          ),
        ],
      ),
    ],
  );
}
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youapp_frontend/core/core.dart';
import 'package:youapp_frontend/login/login.dart';

class AppRouter {
  static final GoRouter routes = GoRouter(
    initialLocation: AppRoute.login,
    navigatorKey: App.instance.navigator,
    routes: [
      GoRoute(
        path: AppRoute.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoute.register,
        builder: (context, state) => Container(),
      ),
      GoRoute(
        path: AppRoute.profile,
        builder: (context, state) => Container(),
      ),
    ],
  );
}

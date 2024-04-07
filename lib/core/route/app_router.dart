import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youapp_frontend/core/core.dart';
import 'package:youapp_frontend/login/login.dart';
import 'package:youapp_frontend/profile/profile.dart';
import 'package:youapp_frontend/register/register.dart';

class AppRouter {
  static final GoRouter routes = GoRouter(
    initialLocation: AppRoute.profile,
    navigatorKey: App.instance.navigator,
    routes: [
      GoRoute(
        path: AppRoute.login,
        pageBuilder: (context, state) => _transitionPage(const LoginScreen()),
      ),
      GoRoute(
        path: AppRoute.register,
        pageBuilder: (context, state) =>
            _transitionPage(const RegisterScreen()),
      ),
      GoRoute(
        path: AppRoute.profile,
        pageBuilder: (context, state) => _transitionPage(const ProfileScreen()),
      ),
    ],
  );

  static CustomTransitionPage _transitionPage(Widget child) {
    return CustomTransitionPage(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeIn).animate(animation),
          child: child,
        );
      },
    );
  }
}

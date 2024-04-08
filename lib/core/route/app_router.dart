import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youapp_frontend/core/core.dart';
import 'package:youapp_frontend/auth/auth.dart';
import 'package:youapp_frontend/profile/profile.dart';

class AppRouter {
  static final GoRouter routes = GoRouter(
    initialLocation: AppRoute.profile,
    navigatorKey: App.instance.navigator,
    routes: [
      GoRoute(
        path: AppRoute.login,
        pageBuilder: (context, state) =>
            _transitionPage(state, const LoginScreen()),
      ),
      GoRoute(
        path: AppRoute.register,
        pageBuilder: (context, state) =>
            _transitionPage(state, const RegisterScreen()),
      ),
      GoRoute(
        path: AppRoute.profile,
        pageBuilder: (context, state) =>
            _transitionPage(state, const ProfileScreen()),
      ),
      GoRoute(
        path: AppRoute.interest,
        pageBuilder: (context, state) =>
            _transitionPage(state, const InterestScreen()),
      ),
    ],
  );

  static CustomTransitionPage _transitionPage(
      GoRouterState state, Widget child) {
    return CustomTransitionPage(
      key: state.pageKey,
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

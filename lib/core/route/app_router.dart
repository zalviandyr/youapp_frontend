import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:youapp_frontend/core/core.dart';
import 'package:youapp_frontend/login/login.dart';
import 'package:youapp_frontend/register/register.dart';

class AppRouter {
  static final GoRouter routes = GoRouter(
    initialLocation: AppRoute.login,
    navigatorKey: App.instance.navigator,
    routes: [
      GoRoute(
        path: AppRoute.login,
        pageBuilder: (context, state) => _transitionPage(LoginScreen()),
      ),
      GoRoute(
        path: AppRoute.register,
        pageBuilder: (context, state) => _transitionPage(RegisterScreen()),
      ),
      GoRoute(
        path: AppRoute.profile,
        builder: (context, state) => Container(),
      ),
    ],
  );

  static CustomTransitionPage _transitionPage(Widget child) {
    return CustomTransitionPage(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return Scaffold(
          body: FadeTransition(
            opacity: CurveTween(curve: Curves.easeIn).animate(animation),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Pallette.gradient1,
                    Pallette.gradient2,
                    Pallette.gradient3,
                  ],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: child,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

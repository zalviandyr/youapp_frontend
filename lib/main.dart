import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youapp_frontend/core/core.dart';

void main() {
  // init app
  App.instance.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, child) {
        return MaterialApp.router(
          title: Config.appName,
          routerConfig: AppRouter.routes,
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.transparent,
              colorScheme: const ColorScheme.light(
                primary: Colors.white,
              ),
              textTheme: GoogleFonts.interTextTheme(
                const TextTheme(
                  headlineSmall: TextStyle(fontWeight: FontWeight.w700),
                ),
              ).apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
                decorationColor: Colors.white,
              )),
          builder: (context, child) {
            return child ?? const SizedBox.shrink();
          },
        );
      },
    );
  }
}

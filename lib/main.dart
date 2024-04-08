import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youapp_frontend/auth/auth.dart';
import 'package:youapp_frontend/core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // init app
  await App.instance.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
      ));
    }

    return ScreenUtilInit(
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => AuthBloc()),
          ],
          child: MaterialApp.router(
            title: Config.appName,
            routerConfig: AppRouter.routes,
            theme: ThemeData(
                brightness: Brightness.dark,
                scaffoldBackgroundColor: Colors.transparent,
                colorScheme: const ColorScheme.dark(
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
            builder: FlutterSmartDialog.init(
              loadingBuilder: (_) => const LoadingDialog(),
              builder: (context, child) => child ?? const SizedBox.shrink(),
            ),
          ),
        );
      },
    );
  }
}

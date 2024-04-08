import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youapp_frontend/core/core.dart';

class GradientScaffold extends StatelessWidget {
  final Widget body;
  final EdgeInsetsGeometry? padding;

  const GradientScaffold({
    super.key,
    required this.body,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
            padding: padding ?? EdgeInsets.symmetric(horizontal: 20.w),
            child: body,
          ),
        ),
      ),
    );
  }
}

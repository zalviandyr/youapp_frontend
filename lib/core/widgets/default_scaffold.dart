import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youapp_frontend/core/core.dart';

class DefaultScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;

  const DefaultScaffold({
    super.key,
    required this.body,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallette.defaultScaffold,
      appBar: appBar,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: body,
        ),
      ),
    );
  }
}

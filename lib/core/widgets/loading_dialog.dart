import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youapp_frontend/core/constants/pallette.dart';
import 'package:youapp_frontend/core/core.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.all(25.r),
      child: const CircularProgressIndicator(
        color: Pallette.gradient1,
      ),
    );
  }
}

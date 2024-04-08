import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

void showSnackbar(String message, {bool isError = false}) {
  SmartDialog.showToast(
    message,
    displayTime: const Duration(seconds: 3),
    builder: (context) {
      return Container(
        width: double.infinity,
        height: 35.h,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: isError ? Colors.red : Colors.green,
        ),
        child: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      );
    },
  );
}

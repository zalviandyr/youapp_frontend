import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Style {
  static final OutlineInputBorder enableBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: BorderSide(color: Colors.white.withOpacity(.40)),
  );

  static final OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: BorderSide(color: Colors.white.withOpacity(.90)),
  );

  static final EdgeInsetsGeometry contentPadding = EdgeInsets.symmetric(
    vertical: 8.h,
    horizontal: 10.w,
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youapp_frontend/core/core.dart';

class Button extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const Button({
    super.key,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 35.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Pallette.buttonGradient1,
                Pallette.buttonGradient2,
              ],
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10.r),
              onTap: onPressed,
            ),
          ),
        )
      ],
    );
  }
}

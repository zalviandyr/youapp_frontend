import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:youapp_frontend/core/core.dart';

class Interest extends StatelessWidget {
  final VoidCallback onEdit;

  const Interest({
    super.key,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 15.h,
        ),
        decoration: BoxDecoration(
          color: Pallette.blackPrimary,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Interest',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                GestureDetector(
                  onTap: onEdit,
                  child: Icon(
                    Iconic.pencil,
                    size: 15.r,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            const Text('Add in your interest to find a better match'),
          ],
        ),
      ),
    );
  }
}

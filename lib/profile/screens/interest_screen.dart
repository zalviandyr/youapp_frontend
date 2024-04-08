import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:youapp_frontend/core/core.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  void _backAction() => context.pop();

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            flexibleSpace: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: _backAction,
                  child: Row(
                    children: [
                      Icon(
                        Icons.chevron_left,
                        size: 26.r,
                      ),
                      const Text(
                        'Back',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: GradientText(
                    'Save',
                    gradientType: GradientType.linear,
                    gradientDirection: GradientDirection.ltr,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                    colors: const [
                      Pallette.blue1,
                      Pallette.blue2,
                      Pallette.blue3,
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: GradientText(
              gradientDirection: GradientDirection.ttb,
              'Tell everyone about yourself',
              colors: Pallette.goldenGradient,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 15.h)),
          const SliverToBoxAdapter(
            child: Text('What interest you?'),
          ),
        ],
      ),
    );
  }
}

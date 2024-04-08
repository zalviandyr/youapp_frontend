import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_chips_input/simple_chips_input.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:youapp_frontend/core/core.dart';
import 'package:fluttericon/modern_pictograms_icons.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  final StringTagController _stringTagController = StringTagController();
  final GlobalKey<FormState> _tagKey = GlobalKey();
  String outputSelectChipsInput = '';

  @override
  void dispose() {
    _stringTagController.dispose();

    super.dispose();
  }

  void _backAction() => context.pop();

  void _saveAction() => _tagKey.currentState?.save();

  void _tagSaveAction(String value) {
    List<String> values = value.split(';').where((e) => e.isNotEmpty).toList();
    print(values);
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              leadingWidth: 150.w,
              leading: GestureDetector(
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
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: GestureDetector(
                    onTap: _saveAction,
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
                ),
              ],
            ),
          ];
        },
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 15.h,
          ),
          children: [
            GradientText(
              gradientDirection: GradientDirection.ttb,
              'Tell everyone about yourself',
              colors: Pallette.goldenGradient,
            ),
            SizedBox(height: 7.h),
            const Text(
              'What interest you?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 14.h),
            SimpleChipsInput(
              formKey: _tagKey,
              separatorCharacter: ';',
              placeChipsSectionAbove: false,
              validateInput: true,
              onSaved: _tagSaveAction,
              validateInputMethod: (String value) {
                if (value.isEmpty) {
                  return 'Please enter a valid interest';
                }

                return null;
              },
              paddingInsideChipContainer: EdgeInsets.symmetric(
                vertical: 5.h,
                horizontal: 10.w,
              ),
              marginBetweenChips: EdgeInsets.all(3.r),
              textFormFieldStyle: TextFormFieldStyle(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 14.w,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(.06),
                ),
              ),
              deleteIcon: SizedBox(
                width: 20.w,
                child: Icon(
                  ModernPictograms.cancel,
                  size: 16.r,
                  color: Colors.white,
                ),
              ),
              chipContainerDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: Colors.white.withOpacity(.1),
              ),
              widgetContainerDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white.withOpacity(.06),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

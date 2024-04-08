import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youapp_frontend/core/core.dart';
import 'package:fluttericon/octicons_icons.dart';

class AboutForm extends StatelessWidget {
  const AboutForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Row(
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(10.r),
                child: Container(
                  padding: EdgeInsets.all(13.r),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.08),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: const Icon(
                    Octicons.plus,
                    color: Pallette.golden,
                  ),
                ),
              ),
            ),
            SizedBox(width: 13.w),
            const Text('Add Image'),
          ],
        ),
        ..._buildInputField('name', 'Display Name:', 'Enter Name'),
        ..._buildDropdownField('gender', 'Gender:', 'Select Gender', [
          BorderedDropdownItem(value: 'Male', label: 'Male'),
          BorderedDropdownItem(value: 'Female', label: 'Female'),
        ]),
        ..._buildDateField('birth_date', 'Birthday:', 'DD MM YYYY'),
        ..._buildInputField('horoscope', 'Horoscope:', '--'),
        ..._buildInputField('zodiac', 'Zodiac:', '--'),
        ..._buildInputField('height', 'Height:', 'Add Height'),
        ..._buildInputField('weight', 'Weight:', 'Add Weight'),
      ],
    );
  }

  List<Widget> _buildInputField(String name, String label, String hintText) {
    return [
      SizedBox(height: 12.h),
      BorderedInputField(
        label: label,
        name: name,
        hintText: hintText,
      ),
    ];
  }

  List<Widget> _buildDateField(String name, String label, String hintText) {
    return [
      SizedBox(height: 12.h),
      BorderedDateField(
        label: label,
        name: name,
        hintText: hintText,
      ),
    ];
  }

  List<Widget> _buildDropdownField(
    String name,
    String label,
    String hintText,
    List<BorderedDropdownItem> items,
  ) {
    return [
      SizedBox(height: 12.h),
      BorderedDropdownField(
        label: label,
        name: name,
        hintText: hintText,
        items: items,
      ),
    ];
  }
}

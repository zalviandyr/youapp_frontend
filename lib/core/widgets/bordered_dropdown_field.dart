import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youapp_frontend/core/core.dart';

class BorderedDropdownItem {
  final String value;
  final String label;

  BorderedDropdownItem({required this.value, required this.label});
}

class BorderedDropdownField extends StatelessWidget {
  final String label;
  final String name;
  final String hintText;
  final List<BorderedDropdownItem> items;

  const BorderedDropdownField({
    super.key,
    required this.label,
    required this.name,
    required this.hintText,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return BorderedInputLabel(
      label: label,
      child: FormBuilderDropdown(
        name: name,
        style: const TextStyle(fontSize: 13),
        isDense: true,
        isExpanded: true,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: Style.contentPadding.subtract(
            EdgeInsets.symmetric(vertical: 2.h),
          ),
          enabledBorder: Style.enableBorder,
          focusedBorder: Style.focusedBorder,
          filled: true,
          fillColor: Pallette.grey.withOpacity(.06),
        ),
        items: items
            .map(
              (e) => DropdownMenuItem(
                value: e.value,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(e.label),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

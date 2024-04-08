import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:youapp_frontend/core/core.dart';

class BorderedDateField extends StatefulWidget {
  final String label;
  final String name;
  final String? hintText;

  const BorderedDateField({
    super.key,
    required this.label,
    required this.name,
    this.hintText,
  });

  @override
  State<BorderedDateField> createState() => _BorderedDateFieldState();
}

class _BorderedDateFieldState extends State<BorderedDateField> {
  final DateFormat _format = DateFormat('dd MMM yyyy');
  String _selectedData = 'DD MM YYYY';

  void _showDatePicker(FormFieldState<DateTime?> state) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      lastDate: DateTime(2100),
      firstDate: DateTime(1950),
    );

    if (date != null) {
      state.didChange(date);

      setState(() => _selectedData = _format.format(date));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: 13,
              color: Colors.white.withOpacity(.50),
            ),
          ),
        ),
        Flexible(
          flex: 4,
          child: FormBuilderField<DateTime?>(
            name: widget.name,
            builder: (state) {
              return GestureDetector(
                onTap: () => _showDatePicker(state),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                    horizontal: 10.w,
                  ),
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    color: Pallette.grey.withOpacity(.06),
                    border: Border.all(color: Colors.white.withOpacity(.40)),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    _selectedData,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white.withOpacity(.50),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

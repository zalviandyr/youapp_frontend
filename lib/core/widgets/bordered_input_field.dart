import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:youapp_frontend/core/core.dart';

enum BorderedInputFieldType {
  text,
  number,
}

class BorderedInputField extends StatelessWidget {
  final String label;
  final String name;
  final String? hintText;
  final String? suffixText;
  final BorderedInputFieldType? type;

  const BorderedInputField({
    super.key,
    required this.label,
    required this.name,
    this.hintText,
    this.suffixText,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: Colors.white.withOpacity(.50),
            ),
          ),
        ),
        Flexible(
          flex: 4,
          child: FormBuilderTextField(
            name: name,
            textAlign: TextAlign.end,
            style: const TextStyle(fontSize: 13),
            keyboardType: type == BorderedInputFieldType.number
                ? TextInputType.number
                : TextInputType.text,
            decoration: InputDecoration(
              hintText: hintText,
              isDense: true,
              contentPadding: Style.contentPadding,
              enabledBorder: Style.enableBorder,
              focusedBorder: Style.focusedBorder,
              filled: true,
              fillColor: Pallette.grey.withOpacity(.06),
              suffixText: suffixText,
              suffixStyle: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

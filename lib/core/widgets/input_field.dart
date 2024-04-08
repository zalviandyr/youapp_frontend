import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:youapp_frontend/core/core.dart';

enum InputType { text, password, email }

class InputField extends StatefulWidget {
  final String name;
  final String? hintText;
  final InputType type;

  const InputField({
    super.key,
    required this.name,
    this.hintText,
    this.type = InputType.text,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late bool _isObscure;

  @override
  void initState() {
    _isObscure = widget.type == InputType.password;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      obscureText: _isObscure,
      obscuringCharacter: '*',
      keyboardType: widget.type == InputType.email
          ? TextInputType.emailAddress
          : TextInputType.text,
      decoration: InputDecoration(
        isDense: true,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(.4),
        ),
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
        suffixIcon: widget.type == InputType.password
            ? GestureDetector(
                onTap: () => setState(() => _isObscure = !_isObscure),
                child: ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: Pallette.goldenGradient,
                  ).createShader(bounds),
                  child: Icon(
                    _isObscure ? FontAwesome.eye_off : FontAwesome.eye,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}

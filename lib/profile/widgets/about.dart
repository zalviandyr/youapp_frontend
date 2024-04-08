import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:intl/intl.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:youapp_frontend/core/core.dart';
import 'package:youapp_frontend/profile/profile.dart';

class About extends StatefulWidget {
  final ValueSetter<ProfileModel> onSave;

  const About({super.key, required this.onSave});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> with TickerProviderStateMixin {
  late final AnimationController _controller1;
  late final Animation<double> _animation1;
  late final AnimationController _controller2;
  late final Animation<double> _animation2;
  final GlobalKey<FormBuilderState> _formKey = GlobalKey();
  final double _minHeight = Platform.isIOS ? 80.h : 100.h;
  final double _maxHeight = Platform.isIOS ? 430.h : 420.h;
  late double _height;

  @override
  void initState() {
    _height = _minHeight;

    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..forward();

    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _animation1 = CurvedAnimation(parent: _controller1, curve: Curves.easeIn);
    _animation2 = CurvedAnimation(parent: _controller2, curve: Curves.easeIn);

    super.initState();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();

    super.dispose();
  }

  void _showEdit() {
    if (_controller2.status == AnimationStatus.dismissed) {
      _controller1.reverse();
      _controller2.forward();

      setState(() => _height = _height == _maxHeight ? _minHeight : _maxHeight);
    }
  }

  void _hideEdit() {
    if (_controller2.status == AnimationStatus.completed) {
      _controller1.forward();
      _controller2.reverse();

      setState(() => _height = _height == _maxHeight ? _minHeight : _maxHeight);
    }
  }

  void _editAction() {
    bool isCurrentEdit = _controller2.status == AnimationStatus.completed;

    if (isCurrentEdit) {
      _formKey.currentState!.save();

      DateTime? birthday = _formKey.currentState!.value['birth_date'];
      DateFormat format = DateFormat('dd MMM yyyy');
      String? date = birthday != null ? format.format(birthday) : null;

      ProfileModel profile = ProfileModel(
        name: _formKey.currentState!.value['name'],
        gender: _formKey.currentState!.value['gender'],
        birthday: date,
        horoscope: _formKey.currentState!.value['horoscope'],
        zodiac: _formKey.currentState!.value['zodiac'],
        height: int.tryParse(_formKey.currentState!.value['height']),
        weight: int.tryParse(_formKey.currentState!.value['weight']),
        profilePicture: 'x',
        interests: [],
      );

      widget.onSave(profile);
    } else {
      _showEdit();
    }
  }

  void _profileListener(BuildContext context, ProfileState state) {
    if (state is ProfileSaveSuccess) {
      SmartDialog.showToast('Profile updated successfully');
      _hideEdit();
    }

    if (state is ProfileSaveFailed) {
      SmartDialog.showToast('Failed to update profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: _profileListener,
      child: SliverToBoxAdapter(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          width: double.infinity,
          height: _height,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'About',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      FadeTransition(
                        opacity: _animation1,
                        child: GestureDetector(
                          onTap: _editAction,
                          child: Icon(
                            Iconic.pencil,
                            size: 15.r,
                          ),
                        ),
                      ),
                      FadeTransition(
                        opacity: _animation2,
                        child: GestureDetector(
                          onTap: _editAction,
                          child: GradientText(
                            gradientDirection: GradientDirection.ttb,
                            'Save & Update',
                            colors: Pallette.goldenGradient,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    FadeTransition(
                      opacity: _animation1,
                      child: const Text(
                          'Add in your your to help others know you better'),
                    ),
                    FadeTransition(
                      opacity: _animation2,
                      child: AboutForm(formKey: _formKey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

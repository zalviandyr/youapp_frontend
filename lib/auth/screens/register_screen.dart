import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:youapp_frontend/core/core.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  void _toLogin() => context.pop();

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 50.h),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Register',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 25.h),
              const InputField(
                name: 'email',
                hintText: 'Enter Email',
                type: InputType.email,
              ),
              SizedBox(height: 15.h),
              const InputField(
                name: 'username',
                hintText: 'Create Username',
              ),
              SizedBox(height: 15.h),
              const InputField(
                name: 'password',
                hintText: 'Create Password',
                type: InputType.password,
              ),
              SizedBox(height: 15.h),
              const InputField(
                name: 'confirmPassword',
                hintText: 'Confirm Password',
                type: InputType.password,
              ),
              SizedBox(height: 15.h),
              Button(
                label: 'Register',
                onPressed: () {},
              ),
              SizedBox(height: 35.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Have an account? '),
                  GestureDetector(
                    onTap: _toLogin,
                    child: GradientText(
                      'Login here',
                      gradientDirection: GradientDirection.ttb,
                      colors: Pallette.goldenGradient,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:youapp_frontend/core/core.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _toRegister() => context.push(AppRoute.register);

  void _loginAction() {
    context.pushReplacement(AppRoute.profile);
  }

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
                'Login',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 25.h),
              const InputField(
                name: 'username',
                hintText: 'Enter Username/Email',
              ),
              SizedBox(height: 15.h),
              const InputField(
                name: 'password',
                hintText: 'Enter Password',
                type: InputType.password,
              ),
              SizedBox(height: 15.h),
              Button(
                label: 'Login',
                onPressed: _loginAction,
              ),
              SizedBox(height: 35.h),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'No account? ',
                      ),
                      TextSpan(
                        text: 'Register here',
                        style: const TextStyle(color: Pallette.golden),
                        recognizer: TapGestureRecognizer()..onTap = _toRegister,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
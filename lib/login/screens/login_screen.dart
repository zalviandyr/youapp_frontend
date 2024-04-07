import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youapp_frontend/core/core.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                onPressed: () {},
              ),
              SizedBox(height: 35.h),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'No account? '),
                      TextSpan(
                        text: 'Register here',
                        style: TextStyle(
                          color: Pallette.golden,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => {print('register')},
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

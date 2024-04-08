import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:youapp_frontend/auth/auth.dart';
import 'package:youapp_frontend/core/core.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey();
  late AuthBloc _authBloc;

  @override
  initState() {
    _authBloc = BlocProvider.of(context);

    super.initState();
  }

  void _toRegister() => context.push(AppRoute.register);

  void _loginAction() {
    if (_formKey.currentState!.saveAndValidate()) {
      FocusScope.of(context).unfocus();

      String email = _formKey.currentState!.value['email'];
      String username = _formKey.currentState!.value['username'];
      String password = _formKey.currentState!.value['password'];

      _authBloc.add(AuthLogin(
        email: email,
        username: username,
        password: password,
      ));
    }
  }

  void _authListener(BuildContext context, AuthState state) {
    if (state is AuthLoading) {
      SmartDialog.showLoading();
    }

    if (state is AuthLoginSuccess ||
        state is AuthLoginFailed ||
        state is AuthError) {
      if (state is AuthLoginSuccess) {
        showSnackbar('User has been logged in successfully');

        context.pushReplacement(AppRoute.profile);
      }

      if (state is AuthLoginFailed) {
        showSnackbar('User not found', isError: true);
      }

      SmartDialog.dismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: _authListener,
      child: GradientScaffold(
        body: FormBuilder(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.only(top: 50.h),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Text(
                'Login',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 25.h),
              const InputField(
                name: 'username',
                hintText: 'Enter Username',
              ),
              SizedBox(height: 15.h),
              const InputField(
                name: 'email',
                hintText: 'Enter Email',
                type: InputFieldType.email,
              ),
              SizedBox(height: 15.h),
              const InputField(
                name: 'password',
                hintText: 'Enter Password',
                type: InputFieldType.password,
              ),
              SizedBox(height: 15.h),
              Button(
                label: 'Login',
                onPressed: _loginAction,
              ),
              SizedBox(height: 35.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No account? '),
                  GestureDetector(
                    onTap: _toRegister,
                    child: GradientText(
                      'Register Here',
                      gradientDirection: GradientDirection.ttb,
                      colors: Pallette.goldenGradient,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

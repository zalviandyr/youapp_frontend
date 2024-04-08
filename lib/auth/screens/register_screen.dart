import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:youapp_frontend/auth/auth.dart';
import 'package:youapp_frontend/core/core.dart';
import 'package:youapp_frontend/core/models/auth_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey();
  late AuthBloc _authBloc;

  @override
  void initState() {
    _authBloc = BlocProvider.of(context);

    super.initState();
  }

  void _toLogin() => context.pop();

  void _registerAction() {
    if (_formKey.currentState!.saveAndValidate()) {
      FocusScope.of(context).unfocus();

      String email = _formKey.currentState!.value['email'];
      String username = _formKey.currentState!.value['username'];
      String password = _formKey.currentState!.value['password'];
      String confirmPassword = _formKey.currentState!.value['confirmPassword'];

      if (password != confirmPassword) {
        _formKey.currentState?.fields['confirmPassword']
            ?.invalidate('Password does not match');

        return;
      }

      AuthModel auth = AuthModel(
        email: email,
        username: username,
        password: password,
      );

      _authBloc.add(AuthRegister(auth: auth));
    }
  }

  void _authListener(BuildContext context, AuthState state) {
    if (state is AuthLoading) {
      SmartDialog.showLoading();
    }

    if (state is AuthRegisterSuccess ||
        state is AuthRegisterFailed ||
        state is AuthError) {
      if (state is AuthRegisterSuccess) {
        showSnackbar('User has been created successfully');

        context.pushReplacement(AppRoute.login);
      }

      if (state is AuthRegisterFailed) {
        showSnackbar('User already exists', isError: true);
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
                'Register',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 25.h),
              const InputField(
                name: 'email',
                hintText: 'Enter Email',
                type: InputFieldType.email,
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
                type: InputFieldType.password,
              ),
              SizedBox(height: 15.h),
              const InputField(
                name: 'confirmPassword',
                hintText: 'Confirm Password',
                type: InputFieldType.password,
              ),
              SizedBox(height: 15.h),
              Button(
                label: 'Register',
                onPressed: _registerAction,
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
        ),
      ),
    );
  }
}

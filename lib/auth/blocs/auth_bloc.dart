import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp_frontend/auth/auth.dart';
import 'package:youapp_frontend/core/core.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthUninitialized()) {
    on(_onLogin);
    on(_onRegister);
  }

  Future<void> _onLogin(AuthLogin event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());

      String? token = await AuthService.login(
        email: event.email,
        username: event.username,
        password: event.password,
      );

      if (token != null) {
        emit(AuthLoginSuccess());
      } else {
        emit(AuthLoginFailed());
      }
    } catch (e, trace) {
      onError(e, trace);

      emit(AuthError());
    }
  }

  Future<void> _onRegister(AuthRegister event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());

      bool isRegistered = await AuthService.register(
        email: event.email,
        username: event.username,
        password: event.password,
      );

      if (isRegistered) {
        emit(AuthRegisterSuccess());
      } else {
        emit(AuthRegisterFailed());
      }
    } catch (e, trace) {
      onError(e, trace);

      emit(AuthError());
    }
  }
}

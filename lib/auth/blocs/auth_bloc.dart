import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp_frontend/auth/auth.dart';
import 'package:youapp_frontend/core/core.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthUninitialized()) {
    on(_onRegister);
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

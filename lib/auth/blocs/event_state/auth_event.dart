import 'package:equatable/equatable.dart';
import 'package:youapp_frontend/core/core.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthLogin extends AuthEvent {
  final AuthModel auth;

  AuthLogin({
    required this.auth,
  });

  @override
  List<Object?> get props => [auth];
}

class AuthRegister extends AuthEvent {
  final AuthModel auth;

  AuthRegister({
    required this.auth,
  });

  @override
  List<Object?> get props => [auth];
}

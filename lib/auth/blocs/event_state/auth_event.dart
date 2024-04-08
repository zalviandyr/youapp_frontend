import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthLogin extends AuthEvent {
  final String email;
  final String username;
  final String password;

  AuthLogin({
    required this.email,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [email, username, password];
}

class AuthRegister extends AuthEvent {
  final String email;
  final String username;
  final String password;

  AuthRegister({
    required this.email,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [email, username, password];
}

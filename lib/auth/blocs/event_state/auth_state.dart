import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthUninitialized extends AuthState {}

class AuthLoading extends AuthState {}

class AuthRegisterSuccess extends AuthState {}

class AuthRegisterFailed extends AuthState {}

class AuthError extends AuthState {}

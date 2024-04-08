import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileUninitialized extends ProfileState {}

class ProfileFetchSuccess extends ProfileState {}

class ProfileSaveSuccess extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileError extends ProfileState {}

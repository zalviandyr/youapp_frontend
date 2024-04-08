import 'package:equatable/equatable.dart';
import 'package:youapp_frontend/core/core.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileUninitialized extends ProfileState {}

class ProfileFetchSuccess extends ProfileState {
  final ProfileModel profile;

  ProfileFetchSuccess({required this.profile});

  @override
  List<Object?> get props => [profile];
}

class ProfileFetchFailed extends ProfileState {}

class ProfileSaveSuccess extends ProfileState {}

class ProfileSaveFailed extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileError extends ProfileState {}

import 'package:equatable/equatable.dart';
import 'package:youapp_frontend/core/core.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileSave extends ProfileEvent {
  final ProfileModel profile;

  ProfileSave({required this.profile});

  @override
  List<Object?> get props => [profile];
}

class ProfileFetch extends ProfileEvent {}

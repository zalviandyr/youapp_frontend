import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp_frontend/core/core.dart';
import 'package:youapp_frontend/profile/profile.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileUninitialized()) {
    on(_onSaveProfile);
    on(_onGetProfile);
  }

  Future<void> _onSaveProfile(
      ProfileSave event, Emitter<ProfileState> emit) async {
    try {
      emit(ProfileLoading());

      await ProfileService.saveProfile(event.profile);

      emit(ProfileSaveSuccess());
    } catch (e, trace) {
      onError(e, trace);

      emit(ProfileSaveFailed());
    }
  }

  Future<void> _onGetProfile(
      ProfileFetch event, Emitter<ProfileState> emit) async {
    try {
      emit(ProfileLoading());

      ProfileModel profile = await ProfileService.getProfile();

      emit(ProfileFetchSuccess(profile: profile));
    } catch (e, trace) {
      onError(e, trace);

      emit(ProfileFetchFailed());
    }
  }
}

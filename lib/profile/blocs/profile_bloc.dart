import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp_frontend/core/core.dart';
import 'package:youapp_frontend/profile/profile.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileUninitialized()) {
    on(_getProfile);
  }

  Future<void> _getProfile(
      ProfileFetch event, Emitter<ProfileState> emit) async {
    try {
      emit(ProfileLoading());

      await ProfileService.getProfile();

      // emit(ProfileFetchSuccess(profile));
    } catch (e, trace) {
      onError(e, trace);

      emit(ProfileError());
    }
  }
}

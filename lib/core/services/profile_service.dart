import 'package:dio/dio.dart';
import 'package:youapp_frontend/core/core.dart';

class ProfileService {
  static final Dio _client = App.instance.client;

  static Future<void> saveProfile(ProfileModel profile) async {
    await _client.post(
      '/createProfile',
      data: profile.toJson(),
    );
  }

  static Future<ProfileModel> getProfile() async {
    Response response = await _client.get('/getProfile');

    Map<String, dynamic> data = response.data;

    return ProfileModel.fromJson(data['data']);
  }
}

import 'package:dio/dio.dart';
import 'package:youapp_frontend/core/core.dart';

class ProfileService {
  static final Dio _client = App.instance.client;

  static Future<void> getProfile() async {
    Response response = await _client.get('/getProfile');

    Map<String, dynamic> data = response.data;

    print(data);
  }
}

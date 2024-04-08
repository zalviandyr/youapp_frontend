import 'package:dio/dio.dart';
import 'package:youapp_frontend/core/core.dart';

class AuthService {
  static final Dio client = App.instance.client;

  static Future<bool> register({
    required String email,
    required String username,
    required String password,
  }) async {
    Response response = await client.post('/register', data: {
      'email': email,
      'username': username,
      'password': password,
    });
    Map<String, dynamic> data = response.data;
    String message = data['message'];

    return message == 'User has been created successfully';
  }
}

import 'package:dio/dio.dart';
import 'package:youapp_frontend/core/core.dart';

class AuthService {
  static final Dio client = App.instance.client;

  static Future<String?> login(AuthModel auth) async {
    Response response = await client.post('/login', data: {
      'email': auth.email,
      'username': auth.username,
      'password': auth.password,
    });

    Map<String, dynamic> data = response.data;

    return data['access_token'];
  }

  static Future<bool> register(AuthModel auth) async {
    Response response = await client.post('/register', data: {
      'email': auth.email,
      'username': auth.username,
      'password': auth.password,
    });
    Map<String, dynamic> data = response.data;
    String message = data['message'];

    return message == 'User has been created successfully';
  }
}

import 'dart:convert';

class AuthModel {
  final String email;
  final String username;
  final String password;
  final String? accessToken;

  AuthModel({
    required this.email,
    required this.username,
    required this.password,
    this.accessToken,
  });

  @override
  String toString() {
    return jsonEncode({
      'email': email,
      'username': username,
      'password': password,
      'accessToken': accessToken,
    });
  }

  factory AuthModel.fromString(String value) {
    Map<String, dynamic> json = jsonDecode(value);

    return AuthModel(
      email: json['email'],
      username: json['username'],
      password: json['password'],
      accessToken: json['accessToken'],
    );
  }

  AuthModel copyWith({
    String? email,
    String? username,
    String? password,
    String? accessToken,
  }) {
    return AuthModel(
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      accessToken: accessToken ?? this.accessToken,
    );
  }
}

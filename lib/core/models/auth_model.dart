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
}

import 'package:domain/entities/user.dart';

class AuthResponse {
  final User user;
  final String token;

  const AuthResponse({required this.user, required this.token});

  AuthResponse fromJson(Map<String, dynamic> json) => AuthResponse(
    user: User.fromJson(json['record'] as Map<String, dynamic>),
    token: json['token'] as String,
  );
}
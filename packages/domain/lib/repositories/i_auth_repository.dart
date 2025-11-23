import '../entities/auth_response.dart';
import '../entities/user.dart';

abstract class IAuthRepository {
  Future<AuthResponse> login(String identity, String password);
  Future<User> register(String email, String password, String passwordConfirm);
  Future<User> getCurrentUser();
  Future<void> logout();
}
import 'package:domain/entities/auth_response.dart';
import 'package:domain/entities/user.dart';
import 'package:domain/repositories/i_auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryMock implements IAuthRepository {
  static const _mockUser = User(
    id: 'user_001',
    email: 'test@matule.ru',
    firstName: 'Иван',
    lastName: 'Иванов',
    secondName: 'Иванович',
    dateBirthday: '1990-01-01',
    gender: 'Мужской',
    emailVisibility: true,
    verified: true,
  );

  @override
  Future<AuthResponse> login(String identity, String password) async {
    await Future.delayed(const Duration(milliseconds: 800));
    if (identity == 'test@matule.ru' && password == '123456') {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', 'mock_jwt_token_2026');
      return AuthResponse(user: _mockUser, token: 'mock_jwt_token_2026');
    }
    throw Exception('Неверный логин или пароль');
  }

  @override
  Future<User> register(String email, String password, String passwordConfirm) async {
    await Future.delayed(const Duration(milliseconds: 1200));
    if (password != passwordConfirm) throw Exception('Пароли не совпадают');
    return _mockUser;
  }

  @override
  Future<User> getCurrentUser() async {
    await Future.delayed(const Duration(milliseconds: 400));
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('auth_token')) {
      return _mockUser;
    }
    throw Exception('Не авторизован');
  }

  @override
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }
}
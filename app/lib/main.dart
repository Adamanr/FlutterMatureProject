import 'package:app/screens/auth/create_password.dart';
import 'package:app/screens/auth/create_pin_password.dart';
import 'package:data/local/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/components/splash_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveService.init();

  runApp(const MatuleApp());
}

class MatuleApp extends StatelessWidget {
  const MatuleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matule 2026',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Manrope',
      ),
      home: const AppSplashScreen(),
      routes: {
        '/login'               : (_) => const LoginScreen(),
        '/register'            : (_) => const RegisterScreen(),
        '/create_password'     : (_) => const CreatePasswordScreen(),
        '/create_pin'          : (_) => const CreatePinPasswordScreen(onSuccess: LoginScreen.new),
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_kit/components/button.dart';
import 'package:ui_kit/components/input.dart';
import 'package:ui_kit/theme/app_colors.dart';
import 'package:ui_kit/theme/app_text_styles.dart';

import '../main/main_shell.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Text('✋', style: TextStyle(fontSize: 32)),
                  const SizedBox(width: 12),
                  Text('Добро пожаловать', style: AppTextStyles.h2),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'Войдите, чтобы пользоваться функциями приложения',
                style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
              ),

              const SizedBox(height: 40),

              const AppTextField(
                hint: "example@email.com",
                label: 'Вход по E-mail',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              const AppTextField(
                hint: 'Пароль',
                isPassword: true
              ),
              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                child: AppButton(
                  text: 'Далее',
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const MainShell()),
                      (route) => false,
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/register');
                  },
                  child: const Text(
                    'Зарегистрироваться',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const Spacer(),

              const Center(
                child: Text(
                  'Или войдите с помощью',
                  style: TextStyle(color: AppColors.textSecondary),
                ),
              ),
              const SizedBox(height: 20),

              Column(
                spacing: 4,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _socialButton('VK'),
                  const SizedBox(width: 32),
                  _socialButton('Yandex'),
                ],
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialButton(String social) {
    return Container(
      width: double.infinity,
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 2,
          color: Colors.black12
        )

      ),
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("packages/ui_kit/assets/icons/$social.svg", width: 32, height: 32),
          Text("Войти с $social", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500))
        ],
      )
    );
  }
}
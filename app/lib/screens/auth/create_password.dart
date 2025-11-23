import 'package:flutter/material.dart';
import 'package:ui_kit/components/button.dart';
import 'package:ui_kit/components/input.dart';
import 'package:ui_kit/theme/app_colors.dart';
import 'package:ui_kit/theme/app_text_styles.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePasswordScreen> {
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
                  Text('Создание пароля', style: AppTextStyles.h2),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'Введите новый пароль',
                style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
              ),

              const SizedBox(height: 40),

              const AppTextField(
                label: 'Новый пароль',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              const AppTextField(
                label: 'Подтвердите пароль',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: AppButton(
                  text: 'Сохранить',
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/create_pin');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
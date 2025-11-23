import 'package:flutter/material.dart';
import 'package:ui_kit/components/button.dart';
import 'package:ui_kit/components/select.dart';
import 'package:ui_kit/components/input.dart';
import 'package:ui_kit/theme/app_colors.dart';
import 'package:ui_kit/theme/app_text_styles.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late String? selectedCity = 'non';

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
              Text('Создание Профиля', style: AppTextStyles.h2),
              const SizedBox(height: 12),
              Text(
                'Без профиля вы не сможете создавать проекты.',
                style: AppTextStyles.body.copyWith(color: AppColors.textSecondary, fontSize: 14),
              ),
              const SizedBox(height: 8),
              Text(
                'В профиле будут храниться результаты проектов и ваши описания.',
                style: AppTextStyles.body.copyWith(color: AppColors.textSecondary, fontSize: 14),
              ),

              const SizedBox(height: 20),

              const AppTextField(
                hint: "Имя",
                keyboardType: TextInputType.emailAddress,
              ),

              const AppTextField(
                hint: "Отчество",
                keyboardType: TextInputType.emailAddress,
              ),

              const AppTextField(
                hint: "Фамилия",
                keyboardType: TextInputType.emailAddress,
              ),

              const AppTextField(
                hint: "Дата рождения",
                keyboardType: TextInputType.emailAddress,
              ),

              AppSelect<String>(
                hint: 'пол',
                value: selectedCity,
                items: [
                  DropdownOption(value: 'non', title: 'Не указано', icon: Icon(Icons.no_accounts)),
                  DropdownOption(value: 'm', title: 'Мужчина', icon: Icon(Icons.male)),
                  DropdownOption(value: 'f', title: 'Женщина', icon: Icon(Icons.female)),
                ],
                onChanged: (val) => setState(() => selectedCity = val),
              ),

              const AppTextField(
                hint: "Почта",
                keyboardType: TextInputType.emailAddress,
              ),


              const SizedBox(height: 48),

              SizedBox(
                width: double.infinity,
                child: AppButton(
                  text: 'Далее',
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/create_pass');
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
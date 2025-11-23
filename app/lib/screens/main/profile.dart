import 'package:flutter/material.dart';
import 'package:ui_kit/components/input_checkbox.dart';
import 'package:ui_kit/theme/app_colors.dart';
import 'package:ui_kit/theme/app_text_styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool notifications = true;

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

              Text('Эдуард', style: AppTextStyles.h2),

              const SizedBox(height: 12),
              Text(
                'afersfsr@dsfsr.ru',
                style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
              ),

              const SizedBox(height: 40),

              InkWell(
                onTap: (){},
                child: Text("📋   Мои заказы", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
              ),

              const SizedBox(height: 14),

              AppSwitch(
                value: notifications,
                onChanged: (val) => setState(() => notifications = val),
                label: '⚙️   Уведомления',
              ),

              const SizedBox(height: 250),

              Center(
                child: InkWell(
                  child: Text(
                    'Политика конфиденциальности',
                    style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: InkWell(
                  child: Text(
                    'Пользовательское соглашение',
                    style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: InkWell(
                  child: Text(
                    'Выход',
                    style: AppTextStyles.body.copyWith(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
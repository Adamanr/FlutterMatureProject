import 'package:flutter/material.dart';
import 'package:ui_kit/theme/app_colors.dart';
import 'package:ui_kit/theme/app_text_styles.dart';

class CreatePinPasswordScreen extends StatefulWidget {
  final VoidCallback onSuccess;
  const CreatePinPasswordScreen({super.key, required this.onSuccess});

  @override
  State<CreatePinPasswordScreen> createState() => _CreatePinPasswordScreenState();
}

class _CreatePinPasswordScreenState extends State<CreatePinPasswordScreen> {
  String pin = '';
  final String correctPin = '1234';

  void _addDigit(String digit) {
    if (pin.length < 4) {
      setState(() => pin += digit);
      if (pin.length == 4) {
        Future.delayed(const Duration(milliseconds: 300), () {
          if (pin == correctPin) {
            widget.onSuccess();
          } else {
            setState(() => pin = '');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Неверный PIN-код'), backgroundColor: AppColors.error),
            );
          }
        });
      }
    }
  }

  void _delete() {
    if (pin.isNotEmpty) setState(() => pin = pin.substring(0, pin.length - 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const SizedBox(height: 100),

          Text('Создайте пароль', style: AppTextStyles.h2),

          const SizedBox(height: 12),

          Text(
            'Для защиты ваших персональных данных',
            style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
          ),

          const SizedBox(height: 40),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (i) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: i < pin.length ? AppColors.primary : AppColors.border,
                  border: Border.all(color: AppColors.border, width: 2),
                ),
              );
            }),
          ),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: ['1', '2', '3'].map((d) => _buildKey(d)).toList(),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: ['4', '5', '6'].map((d) => _buildKey(d)).toList(),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: ['7', '8', '9'].map((d) => _buildKey(d)).toList(),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 100),
                    _buildKey('0'),
                    const SizedBox(width: 24),
                    _buildDeleteKey(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKey(String digit) {
    return GestureDetector(
      onTap: () => _addDigit(digit),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.surface,
          border: Border.all(color: AppColors.border.withOpacity(0.5)),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 10,
              color: Colors.black.withOpacity(0.05),
            ),
          ],
        ),
        child: Center(
          child: Text(
            digit,
            style: AppTextStyles.h1.copyWith(
              fontSize: 36,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteKey() {
    return GestureDetector(
      onTap: _delete,
      child: Container(
        width: 80,
        height: 80,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: const Icon(Icons.backspace_outlined, size: 32, color: AppColors.textSecondary),
      ),
    );
  }
}
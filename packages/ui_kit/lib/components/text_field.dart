import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_colors.dart';

class AppTextField extends StatefulWidget {
  final String hint;
  final bool isPassword;
  final String? errorText;
  final bool enabled;
  final TextEditingController? controller;

  const AppTextField({
    super.key,
    required this.hint,
    this.isPassword = false,
    this.errorText,
    this.enabled = true,
    this.controller,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    final hasError = widget.errorText != null;
    return TextField(
      controller: widget.controller,
      enabled: widget.enabled,
      obscureText: widget.isPassword && _obscure,
      style: AppTextStyles.body,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
        filled: true,
        fillColor: widget.enabled
            ? AppColors.surface
            : AppColors.disabled.withOpacity(0.1),
        errorText: widget.errorText,
        errorStyle: const TextStyle(color: AppColors.error),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: hasError ? AppColors.error : AppColors.border,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: hasError ? AppColors.error : AppColors.border,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                onPressed: () => setState(() => _obscure = !_obscure),
              )
            : null,
      ),
    );
  }
}

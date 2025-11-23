import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AppTextField extends StatefulWidget {
  final String? hint;
  final String? label;
  final bool isPassword;
  final bool hasError;
  final bool enabled;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;

  const AppTextField({
    super.key,
    this.hint,
    this.label,
    this.isPassword = false,
    this.hasError = false,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.keyboardType,
    this.onTap,
    this.onChanged,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.isPassword;
  }

  void _toggleObscure() => setState(() => _obscure = !_obscure);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 6),
        ],
        TextField(
          controller: widget.controller,
          enabled: widget.enabled,
          readOnly: widget.onTap != null,
          onTap: widget.onTap,
          onChanged: widget.onChanged,
          keyboardType: widget.keyboardType,
          obscureText: _obscure,
          style: AppTextStyles.body,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: AppTextStyles.hint,
            filled: true,
            fillColor: widget.enabled
                ? AppColors.surface
                : AppColors.disabled.withOpacity(0.08),

            prefixIcon: widget.prefixIcon != null
                ? Padding(
              padding: const EdgeInsets.all(14),
              child: widget.prefixIcon,
            )
                : null,
            suffixIcon: widget.isPassword
                ? IconButton(
              icon: Icon(
                _obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                color: AppColors.textSecondary,
              ),
              onPressed: _toggleObscure,
            )
                : widget.suffixIcon,

            border: _border(),
            enabledBorder: _border(),
            focusedBorder: _border(focused: true),
            errorBorder: _border(error: true),
            disabledBorder: _border(),

            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _border({bool focused = false, bool error = false}) {
    final color = error || widget.hasError
        ? AppColors.error
        : focused
        ? AppColors.primary
        : AppColors.border;

    final width = focused ? 2.0 : 1.5;

    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
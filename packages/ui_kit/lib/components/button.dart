import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

enum ButtonStyle { primary, secondary, outline, text }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonStyle style;
  final bool isLoading;

  const AppButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.style = ButtonStyle.primary,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _bgColor,
          foregroundColor: _textColor,
          elevation: style == ButtonStyle.outline ? 0 : 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: style == ButtonStyle.outline
                ? const BorderSide(color: AppColors.primary)
                : BorderSide.none,
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(color: Colors.white),
              )
            : Text(text, style: AppTextStyles.button),
      ),
    );
  }

  Color get _bgColor {
    if (!onPressed.isEnabled) return AppColors.disabled;
    return switch (style) {
      ButtonStyle.primary => AppColors.primary,
      ButtonStyle.secondary => AppColors.surface,
      ButtonStyle.outline => Colors.transparent,
      ButtonStyle.text => Colors.transparent,
    };
  }

  Color get _textColor {
    return switch (style) {
      ButtonStyle.primary => Colors.white,
      ButtonStyle.secondary => AppColors.primary,
      ButtonStyle.outline => AppColors.primary,
      ButtonStyle.text => AppColors.textPrimary,
    };
  }
}

extension on VoidCallback? {
  bool get isEnabled => this != null;
}

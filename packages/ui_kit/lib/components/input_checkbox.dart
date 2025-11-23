import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AppSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final String label;
  final String? icon;

  const AppSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onChanged != null ? () => onChanged!(!value) : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
        child: Row(
          children: [
            if (icon != null) ...[
              Text(icon!, style: const TextStyle(fontSize: 24)),
              const SizedBox(width: 16),
            ],

            Expanded(
              child: Text(
                label,
                style: AppTextStyles.body.copyWith(
                  fontSize: 24,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            Transform.scale(
              scale: 0.9,
              child: Switch(
                value: value,
                onChanged: onChanged,
                activeColor: AppColors.primary,
                activeTrackColor: AppColors.primary,
                inactiveThumbColor: Colors.grey[400],
                inactiveTrackColor: Colors.grey[300],
                thumbColor: WidgetStateProperty.all(Colors.white),
                trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
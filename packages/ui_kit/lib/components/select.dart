import 'package:flutter/material.dart';
import 'package:ui_kit/components/bottom_sheet.dart';
import 'package:ui_kit/theme/app_colors.dart';
import 'package:ui_kit/theme/app_text_styles.dart';

class AppSelect<T> extends StatelessWidget {
  final String hint;
  final String? label;

  final T? value;
  final List<DropdownOption<T>> items;
  final ValueChanged<T?>? onChanged;
  final bool enabled;

  const AppSelect({
    super.key,
    this.label,
    required this.hint,
    this.value,
    required this.items,
    this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final selected = items.firstWhereOrNull((e) => e.value == value);

    return GestureDetector(
      onTap: enabled ? () => _showBottomSheet(context) : null,
      child: Container(
        height: 56,
        margin: const EdgeInsets.only(top: 24),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: enabled ? AppColors.surface : AppColors.disabled.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.border,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            if (label != null) ...[
              Text(
                label!,
                style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 6),
            ],
            if (selected?.icon != null) ...[
              selected!.icon!,
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Text(
                selected?.title ?? hint,
                style: AppTextStyles.body.copyWith(
                  color: selected == null ? AppColors.textSecondary : AppColors.textPrimary,
                ),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: enabled ? AppColors.textSecondary : AppColors.disabled,
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AppBottomSheet(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: items.length,
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemBuilder: (context, i) {
            final item = items[i];
            final isSelected = value == item.value;

            return ListTile(
              leading: item.icon,
              title: Text(
                item.title,
                style: AppTextStyles.body.copyWith(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected ? AppColors.primary : AppColors.textPrimary,
                ),
              ),
              trailing: isSelected
                  ? const Icon(Icons.check, color: AppColors.primary)
                  : null,
              onTap: () {
                Navigator.pop(context);
                onChanged?.call(item.value);
              },
            );
          },
        ),
      ),
    );
  }
}

class DropdownOption<T> {
  final T value;
  final String title;
  final Widget? icon;

  DropdownOption({required this.value, required this.title, this.icon});
}

extension IterableExt<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    for (final e in this) {
      if (test(e)) return e;
    }
    return null;
  }
}
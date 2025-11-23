import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AppBottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final List<_BarItem> _items = const [
    _BarItem(icon: Icons.home, label: 'Главная'),
    _BarItem(icon: Icons.menu_book, label: 'Каталог'),
    _BarItem(icon: Icons.list_alt, label: 'Проекты'),
    _BarItem(icon: Icons.person, label: 'Профиль'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: 72,
          child: Row(
            children: _items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              final isActive = currentIndex == index;

              return Expanded(
                child: InkWell(
                  onTap: () => onTap(index),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item.icon, color: isActive ? AppColors.primary : AppColors.textSecondary),
                      const SizedBox(height: 4),
                      Text(
                        item.label,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: isActive ? AppColors.primary : AppColors.textSecondary,
                          fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _BarItem {
  final IconData icon;
  final String label;
  const _BarItem({required this.icon, required this.label});
}
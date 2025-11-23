import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppTabBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const AppTabBar({super.key, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
        BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Каталог'),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Корзина',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
      ],
    );
  }
}

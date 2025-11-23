import 'package:app/screens/main/cart.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/components/button.dart';
import 'package:ui_kit/components/input.dart';
import 'package:ui_kit/components/product_detail_bottom_sheet.dart';
import 'package:ui_kit/theme/app_colors.dart';
import 'package:ui_kit/theme/app_text_styles.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});
  @override State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  int selectedFilter = 0;
  final filters = ['Все', 'Женщинам', 'Мужчинам'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const SizedBox(height: 40),

          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(14),
            child: Row(
              spacing: 20,
              children: [
                Expanded(child: AppTextField(
                  hint: 'Искать описания',
                  prefixIcon: const Icon(Icons.search, color: AppColors.textSecondary),
                )),
                Padding(padding: EdgeInsetsGeometry.only(bottom: 14),
                child:   IconButton(
                  icon: const Icon(Icons.person, size: 45),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => const CartScreen(),
                      ),
                    );
                  },
                ),
              )
            ],
           ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: filters.asMap().entries.map((e) {
                final i = e.key;
                final text = e.value;
                final active = selectedFilter == i;
                return Padding(
                  padding: EdgeInsets.only(right: i < filters.length - 1 ? 12 : 0),
                  child: GestureDetector(
                    onTap: () => setState(() => selectedFilter = i),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: active ? AppColors.primary : AppColors.surface,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        text,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: active ? Colors.white : AppColors.textPrimary,
                          fontWeight: active ? FontWeight.w600 : FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 24),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: const [
                _CatalogItem(
                  title: 'Рубашка Воскресенье для машинного вязания',
                  category: 'Мужская одежда',
                  price: '300 ₽',
                ),
                SizedBox(height: 16),
                _CatalogItem(
                  title: 'Шорты вторик для машинного вязания',
                  category: 'Мужская одежда',
                  price: '300 ₽',
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CatalogItem extends StatelessWidget {
  final String title;
  final String category;
  final String price;

  const _CatalogItem({
    required this.title,
    required this.category,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ProductDetailBottomSheet.show(context),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 12, offset: const Offset(0, 4)),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.bodyMedium),
                  const SizedBox(height: 4),
                  Text(category, style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary)),
                  const SizedBox(height: 12),
                  Text(price, style: AppTextStyles.h2.copyWith(color: AppColors.primary)),
                ],
              ),
            ),
            AppButton(
              text: 'Добавить',
              onPressed: () => ProductDetailBottomSheet.show(context),
            ),
          ],
        ),
      ),
    );
  }
}
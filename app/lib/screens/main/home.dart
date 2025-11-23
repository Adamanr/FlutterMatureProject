import 'package:flutter/material.dart';
import 'package:ui_kit/components/button.dart';
import 'package:ui_kit/components/input.dart';
import 'package:ui_kit/theme/app_colors.dart';
import 'package:ui_kit/theme/app_text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AppTextField(
            hint: 'Искать описания',
            enabled: true,
            prefixIcon: const Icon(Icons.search, color: AppColors.textSecondary),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            Text('Акции и новости', style: AppTextStyles.blockLabel),
            const SizedBox(height: 16),

            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _PromoCard(
                    title: 'Шорты\nВетерник',
                    price: '4000 ₽',
                    image: 'https://i.pinimg.com/736x/79/38/ea/7938ea45fc65292e835c7a30a0beeda0.jpg',
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.8, 1),
                      colors: <Color>[
                        Color(0xff97D9F0),
                        Color(0xff92E9D4),
                      ],
                      tileMode: TileMode.mirror,
                    ),
                  ),
                  SizedBox(width: 16),
                  _PromoCard(
                    title: 'Рубашка\nВоск',
                    price: '8000 ₽',
                    image: 'https://i.pinimg.com/736x/74/15/6c/74156cf777ace5970b631219affb056b.jpg',
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.8, 1),
                      colors: <Color>[
                        Color(0xff1f005c),
                        Color(0xff5b0060),
                        Color(0xff870160),
                        Color(0xffac255e),
                        Color(0xffca485c),
                        Color(0xffe16b5c),
                        Color(0xfff39060),
                        Color(0xffffb56b),
                      ],
                      tileMode: TileMode.mirror,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            Text('Каталог описаний', style: AppTextStyles.blockLabel),

            const SizedBox(height: 16),

            const _FilterChips(),

            const SizedBox(height: 24),

            const _ProductCard(
              title: 'Рубашка Воскресенье для машинного вязания',
              subtitle: 'Мужская одежда',
              price: '300 ₽',
            ),

            const SizedBox(height: 16),

            const _ProductCard(
              title: 'Рубашка Воскресенье для машинного вязания',
              subtitle: 'Мужская одежда',
              price: '300 ₽',
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class _PromoCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final LinearGradient gradient;

  const _PromoCard({
    required this.title,
    required this.price,
    required this.image,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 152,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: AppTextStyles.h2.copyWith(height: 1.2, color: Colors.white, fontWeight: FontWeight.w800)),
                const SizedBox(height: 20),
                Text(price, style: AppTextStyles.h1.copyWith(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800)),
              ],
            ),
          ),
          Image.network(image, width: 100, height: 100),
        ],
      ),
    );
  }
}

class _FilterChips extends StatefulWidget {
  const _FilterChips();

  @override
  State<_FilterChips> createState() => _FilterChipsState();
}

class _FilterChipsState extends State<_FilterChips> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _chip('Все', 0),
        const SizedBox(width: 12),
        _chip('Женщинам', 1),
        const SizedBox(width: 12),
        _chip('Мужчинам', 2),
      ],
    );
  }

  Widget _chip(String text, int index) {
    final active = selected == index;
    return GestureDetector(
      onTap: () => setState(() => selected = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: active ? AppColors.primary : AppColors.surface,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: AppTextStyles.body.copyWith(
            color: active ? Colors.white : AppColors.textPrimary,
            fontWeight: active ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;

  const _ProductCard({
    required this.title,
    required this.subtitle,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 4)),
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
                Text(subtitle, style: AppTextStyles.bodySmall),
                const SizedBox(height: 12),
                Text(price, style: AppTextStyles.h2.copyWith(color: AppColors.primary)),
              ],
            ),
          ),
          AppButton(
            text: 'Добавить',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
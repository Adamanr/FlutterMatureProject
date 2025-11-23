import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';
import 'button.dart';

class ProductDetailBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const _ProductDetailSheet(),
    );
  }
}

class _ProductDetailSheet extends StatelessWidget {
  const _ProductDetailSheet();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 40, height: 4, color: Colors.grey[300], margin: const EdgeInsets.only(top: 12)),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Рубашка воскресенье для машинного вязания',
                        style: AppTextStyles.h2,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: 'Описание:\n', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey, fontSize: 16)),
                      TextSpan(text: 'Мой выбор для этих шапок – каринские составы, которые раскрываются идеальным пушком. Сложность – несложная, свяжется с ними отлично подойдёт на шляпу.\n\nКаринские составы берём в большом количестве – 2–3 мотка будет ровно так, чтобы хватило на шапку.\n\nПряжу 1400–1500 м в 100 г в 4 сложения, пряжу 700 м в 2 сложения. Ориентир для конечной толщины – 300–350 м в 100 г.\n\nАртикулы, из которых мы вязали эти модели:\nZermatt, Zegna Baruffa, Cashfive, Baby Cashmere\nLoro Piana, Soft Donegal и другие.\n', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: 'Примерный расход:\n', style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey, fontSize: 14)),
                      TextSpan(text: '80-90 г\n', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,)),
                    ],
                  ),
                ),

                SizedBox(
                  width: double.infinity,
                  child: AppButton(
                    text: 'Добавить за 690 ₽',
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Добавлено в корзину!')),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 20),
        ],
      ),
    );
  }
}
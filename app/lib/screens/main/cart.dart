import 'package:flutter/material.dart';
import 'package:ui_kit/components/button.dart';
import 'package:ui_kit/theme/app_colors.dart';
import 'package:ui_kit/theme/app_text_styles.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<CartItem> items = [
    CartItem(title: 'Рубашка воскресенье для машинного вязания', price: 300, quantity: 1),
    CartItem(title: 'Шорты вторник для машинного вязания', price: 300, quantity: 1),
    CartItem(title: 'Шорты вязания', price: 100, quantity: 2),
  ];

  int get total => items.fold(0, (sum, item) => sum + item.price * item.quantity);

  void _updateQuantity(int index, int delta) {
    setState(() {
      items[index].quantity = (items[index].quantity + delta).clamp(1, 99);
    });
  }

  void _removeItem(int index) {
    setState(() => items.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    final isEmpty = items.isEmpty;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Корзина', style: AppTextStyles.h2),
        backgroundColor: Colors.white,
        actions: [
          if (!isEmpty)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () => setState(() => items.clear()),
            ),
        ],
      ),
      body: isEmpty
          ? const Center(child: Text('Корзина пуста', style: AppTextStyles.body))
          : Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, i) {
                final item = items[i];
                return _CartItemCard(
                  item: item,
                  onQuantityChanged: (delta) => _updateQuantity(i, delta),
                  onRemove: () => _removeItem(i),
                );
              },
            ),
          ),
          Padding(
              padding: EdgeInsetsGeometry.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Сумма', style: AppTextStyles.h2),
                  Text('$total ₽', style: AppTextStyles.h1.copyWith(color: AppColors.primary)),
                ],
              )
          ),

          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: AppButton(
              text: 'Перейти к оформлению заказа',
              onPressed: () {
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem {
  final String title;
  final int price;
  int quantity;
  CartItem({required this.title, required this.price, required this.quantity});
}

class _CartItemCard extends StatelessWidget {
  final CartItem item;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback onRemove;

  const _CartItemCard({
    required this.item,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 12, offset: const Offset(0, 4))],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, style: AppTextStyles.bodyMedium, maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 8),
                Text('${item.price} ₽', style: AppTextStyles.h2.copyWith(color: AppColors.primary)),
              ],
            ),
          ),
          const SizedBox(width: 12),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${item.quantity} штук', style: AppTextStyles.body),
              const SizedBox(width: 12),
              _QuantityButton(icon: Icons.remove, onTap: () => onQuantityChanged(-1)),
              const SizedBox(width: 8),
              _QuantityButton(icon: Icons.add, onTap: () => onQuantityChanged(1)),
            ],
          ),
          const SizedBox(width: 12),

          GestureDetector(
            onTap: onRemove,
            child: const Icon(Icons.close, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _QuantityButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Icon(icon, size: 20, color: AppColors.textPrimary),
      ),
    );
  }
}
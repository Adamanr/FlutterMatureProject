import 'package:flutter/material.dart';

class AppBottomSheet extends StatelessWidget {
  final Widget child;
  const AppBottomSheet({super.key, required this.child});

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
          const SizedBox(height: 8),
          Container(width: 40, height: 4, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Flexible(child: child),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 20),
        ],
      ),
    );
  }
}
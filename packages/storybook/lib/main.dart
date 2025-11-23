import 'package:flutter/material.dart';
import 'package:ui_kit/components/input.dart';

void main() => runApp(const StorybookApp());

class StorybookApp extends StatelessWidget {
  const StorybookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('UI Kit — Matule 2026')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text('Text Fields', style: TextStyle(fontSize: 24)),
            AppTextField(hint: "Normal"),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BudgetsScreen extends StatelessWidget {
  const BudgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Бюджеты')),
      body: const Center(
        child: Text('Здесь будут лимиты по категориям 💼'),
      ),
    );
  }
}

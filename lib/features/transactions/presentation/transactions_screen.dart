import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Операции')),
      body: const Center(
        child: Text('Здесь будет лента доходов и расходов 🧾'),
      ),
    );
  }
}

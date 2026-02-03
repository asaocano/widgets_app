import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  static const name = "counter_screen";
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter screen')),
      body: Center(child: Text('Valor: 0', style: Theme.of(context).textTheme.titleLarge,)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

//ConsumerWidget permite consumir la información de riverpod
class CounterScreen extends ConsumerWidget {
  static const name = "counter_screen";
  const CounterScreen({super.key});

  @override
  //Se agrega la referencia para poder acceder a las variables del provider
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter screen'),
        actions: [
          IconButton(
            onPressed: () {
              ref
                  .read(isDarkModeProvider.notifier)
                  .update((isDarkMode) => !isDarkMode);
            },
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Valor: $clickCounter',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              .read(counterProvider.notifier)
              .state++; //Aumentar o cambiar el valor de la variable en el provider
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

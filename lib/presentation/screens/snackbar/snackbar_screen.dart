import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = "snackbar_screen";
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).clearSnackBars(); //Se cierran los snackbar abiertos anteriormente

    final snackbar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(snackbar); //Se muestra el snackbar creado
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false, //Evita que un toque fuera del diálogo lo cierre
      context: context, //Contexto de la aplicación
      builder: (context) => AlertDialog( //Creación del diálogo
        title: const Text('¿Estás seguro?'),
        content: const Text(
          'Et aute sint aute amet ullamco elit irure voluptate magna irure. Veniam magna Lorem aliqua dolore ipsum. Est eiusmod qui adipisicing ullamco velit dolore non culpa. Deserunt dolore nostrud velit exercitation magna.',
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(), //Cierra el diálogo
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => context.pop(), //Cierra el diálogo
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snackbars')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text(
                      'Est sit voluptate veniam ullamco nulla. Minim laborum incididunt ex minim exercitation cupidatat officia esse quis sit. Non aute aliquip veniam ipsum laborum non ipsum ea et amet laborum. Velit enim excepteur exercitation anim.',
                    ),
                  ],
                );
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar diálogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text('Mostrar snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}

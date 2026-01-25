import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});
  static const name = "buttons_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buttons screen')),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop(); //Regresa a la pantalla anterior
        },
        child: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return
    //* SizedBox
    // Una caja con un tamaño especifico,
    // que también fuerza a su child a que
    // respete su tamaño impuesto.
    SizedBox(
      width: double
          .infinity, //Define el largo del widget a todo el espacio disponible
      //* Padding:
      // Añade un relleno (padding),
      // que permite al hijo acomodarse a ese
      // nuevo espacio.
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ), //aplicar padding de forma equilibrada y simultánea en los ejes vertical u horizontal
        child:
            //*  Wrap:
            // Similar al Column y Row, pero permite
            // ajustar sus hijos de forma vertical y
            // horizontal acorde al número de hijos.
            Wrap(
              spacing: 10, //Espacio entre los hijos
              alignment:
                  WrapAlignment.center, //Que los hijos se alineen al centro
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Elevated button'),
                ),

                const ElevatedButton(
                  onPressed: null,
                  child: Text('Elevated disabled'),
                ),

                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.access_alarm_rounded),
                  label: Text('Elevated icon'),
                ),

                FilledButton(onPressed: () {}, child: const Text('Filled')),

                FilledButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.access_time_filled_rounded),
                  label: Text('Filled icon'),
                ),

                OutlinedButton(onPressed: () {}, child: const Text('Outlined')),

                OutlinedButton.icon(
                  onPressed: () {},
                  label: const Text('Outlined'),
                  icon: Icon(Icons.abc_outlined),
                ),

                TextButton(onPressed: () {}, child: Text('Text button')),

                TextButton.icon(
                  onPressed: () {},
                  label: Text('Text button'),
                  icon: Icon(Icons.accessible_forward),
                ),

                const CustomButtom(),
                IconButton(onPressed: () {}, icon: Icon(Icons.free_breakfast)),

                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.free_breakfast),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(colors.primary),
                    iconColor: WidgetStatePropertyAll(Colors.white),
                  ),
                ),
              ],
            ),
      ),
    );
  }
}

class CustomButtom extends StatelessWidget {
  const CustomButtom({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect( //Widget que convierte al hijo en un rectángulo redondeado
      borderRadius: BorderRadius.circular(20), //Qué tanto queremos que se redondee
      child: Material( //Widget para aplicar diferentes estilos de material al hijo
        color: colors.primary, //Color primario del tema
        child: InkWell( //Área rectangular que responde a los eventos táctiles del usuario con un "splash"
          onTap: null, //Función que ejecuta al tocar el botón
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Custom button', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}

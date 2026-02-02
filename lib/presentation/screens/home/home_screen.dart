import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const name = "home_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets + flutter')),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];

        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({required this.menuItem});

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text((menuItem.subtitle)),
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => const ButtonsScreen())
        // );
        // Navigator.pushNamed(context, menuItem.link);

        //Navegación mediante urls
        context.push(menuItem.link,); //Se pone la locación "encima" para poder regresar después

        //Navegacion por nombre
        // context.pushNamed(CardsScreen.name);
      },
    );
  }
}

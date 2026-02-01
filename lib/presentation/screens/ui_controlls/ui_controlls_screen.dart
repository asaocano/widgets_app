import 'package:flutter/material.dart';

class UiControllsScreen extends StatelessWidget {
  static const name = "uicontrolls_screen";
  const UiControllsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI controls')),
      body: _UiControlsView(),
    );
  }
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;
  Transportation? selected = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: isDeveloper,
          title: Text('Developer mode'),
          subtitle: const Text('Controles adicionales'),
          onChanged: (value) {
            setState(() {
              isDeveloper = !isDeveloper;
            });
          },
        ),
        ExpansionTile(
          title: const Text('Vehículo de transporte'),
          subtitle: Text('$selected'),
          children: [
            RadioGroup<Transportation>(
              groupValue: selected,
              onChanged: (Transportation? value) {
                setState(() {
                  selected = value;
                });
              },
              child: Column(
                children: const [
                  RadioListTile<Transportation>(
                    value: Transportation.car,
                    title: Text('Auto'),
                    subtitle: Text('Viajar por auto'),
                  ),
                  RadioListTile<Transportation>(
                    value: Transportation.boat,
                    title: Text('Barco'),
                    subtitle: Text('Viajar por barco'),
                  ),
                  RadioListTile<Transportation>(
                    value: Transportation.plane,
                    title: Text('Avión'),
                    subtitle: Text('Viajar por avión'),
                  ),
                  RadioListTile<Transportation>(
                    value: Transportation.submarine,
                    title: Text('Submarino'),
                    subtitle: Text('Viajar por submarino'),
                  ),
                ],
              ),
            ),
          ],
        ),
        CheckboxListTile(
          title: Text('¿Quiere desayuno?'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: Text('¿Quiere almorzar?'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: Text('¿Quiere cenar?'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        )
      ],
    );
  }
}

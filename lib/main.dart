import 'package:flutter/material.dart';
import 'features/bienvenida/pantalla_bienvenida.dart';

void main() {
  runApp(const MiAppPorraDAM());
}

class MiAppPorraDAM extends StatelessWidget {
  const MiAppPorraDAM({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Porra DAM',
      home: PantallaBienvenida(),
    );
  }
}

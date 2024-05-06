import 'package:contador_app/funtion_contador/contenedor/body.dart';
import 'package:flutter/material.dart';

class CounterFunction extends StatelessWidget {
  const CounterFunction({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Color.fromARGB(100, 20, 0, 0)
      ),
      home: const Body(),
    );
  }
}

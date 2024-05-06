import 'package:flutter/material.dart';
import 'package:hello_world_app/src/screens/counter/counter_function_screens.dart';
// import 'package:hello_world_app/src/screens/counter/counter_screens.dart';
//un widget es un componente del interfaz de usuario como botones, colores, etc.
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    //Al ser  estático se debe poner const
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed:const Color.fromARGB(199, 4, 0, 255),
      ),
      home: const CounterFunctionScreens()

    );
  }

}

import 'package:flutter/material.dart';

const colors = <Color>[
  Color.fromARGB(255, 59, 50, 175),
  Color.fromARGB(255, 255, 55, 55),
  Color.fromARGB(255, 9, 156, 255),
  Color.fromARGB(255, 229, 32, 255),
  Color.fromARGB(255, 242, 255, 1),
];

class AppTheme {
  final int selectColor;

  AppTheme({this.selectColor = 1}
  ):assert(selectColor <= colors.length,'El numero sobrepasa'),
  assert(selectColor>= 0, 'El numero es negativo') ;

  ThemeData get getTheme => ThemeData(
    colorSchemeSeed: colors[selectColor - 1],
    appBarTheme: const AppBarTheme(
      centerTitle: true
    ),
    );
}

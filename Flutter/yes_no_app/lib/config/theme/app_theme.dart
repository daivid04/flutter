import 'package:flutter/material.dart';

const List<Color> _colorThemes = [
  Color.fromARGB(255, 247, 51, 51),
  Color.fromARGB(255, 171, 74, 212),
  Color.fromARGB(255, 247, 111, 229),
  Color.fromARGB(255, 255, 255, 0),
  Color.fromARGB(255, 0, 119, 255),
  Color.fromARGB(255, 250, 70, 220),
  Color.fromARGB(255, 0, 0, 0),
  Color.fromARGB(255, 98, 253, 106)
];

class AppTheme {
  final int selectColor;

  AppTheme({this.selectColor = 0})
      : assert(selectColor > 0 && selectColor <= _colorThemes.length,
            'There are colors from 1 to ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: _colorThemes[selectColor - 1],
      shadowColor: const Color.fromARGB(200, 255, 200, 100),
      // brightness: Brightness.dark
    );
  }

  Color themeBackgroundColor() => _colorThemes[selectColor];
}

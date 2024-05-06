import 'dart:io';

void main() {
  print('Hola hermano');
  stdout.write('¿Cómo estas?\n'); //stdout.write
  String? estado = stdin.readLineSync();
  print(estado);
}

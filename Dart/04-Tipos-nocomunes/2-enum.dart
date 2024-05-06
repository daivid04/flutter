import 'dart:io';

enum colores {
  //Una clase especial
  amarillo,
  rojo,
  verde,
  azul,
  negro,
  blanco,
  cafe,
  morado,
  anaranjado,
  rosa,
  piel
}

void main() {
  stdout.writeln('¿Cual es su color favorito?');
  String favorito = stdin.readLineSync()!;
  favorito = favorito.toLowerCase();
  for (colores color in colores.values) {
    //Cada valor de Colores es Colores.<Color>
    if (color.toString().split('.').last == favorito) {
      print('Tu color favorito es $favorito');
    }
  }
}

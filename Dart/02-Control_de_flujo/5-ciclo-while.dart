import 'dart:io';

void main() {
  String continuar = 'y';
  int contador = 0;
  while (continuar == 'y' || continuar == 'Y') {
    contador++;
    stdout.write('Intento n°$contador: \n¿Desea continuar? (y/n) ');
    continuar = stdin.readLineSync() ?? '';
  }
}

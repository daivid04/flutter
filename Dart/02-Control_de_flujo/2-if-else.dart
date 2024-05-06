import 'dart:io';

void main() {
  stdout.write('Ingrese su edad: ');
  int edad = int.tryParse(stdin.readLineSync()!) ?? 0;
  if (edad < 18) {
    stdout.write('Menor de edad');
  } else if (edad <= 20) {
    stdout.write('Mayor de edad');
  } else {
    stdout.write('Ciudadano');
  }
}

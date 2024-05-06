import 'dart:io';

//Argumentos posicionales
void saludar(String nombre, [String apellido = '']) {
  //Los argumentos entre [] son opcionales
  print('Buenos días, $nombre $apellido');
}

//Argumentos por nombres
void saludar2(String universidad, {required String nombre, int? edad}) {
//Puedes combinar los argumentos posicionales y por nombres
  print('$nombre tiene $edad años');
}

void main() {
  stdout.write('Ingrese su  nombre: ');
  final String Nombre = (stdin.readLineSync()!);
  stdout.write('Ingrese su apellido: ');
  final String apellido = (stdin.readLineSync()!);
  saludar(Nombre, apellido);
  print('Saludar por nombres: ');
  saludar2('Jorge Basadre', nombre: Nombre, edad: 15);
}

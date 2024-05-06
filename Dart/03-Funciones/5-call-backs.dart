// ignore_for_file: unused_local_variable
import 'dart:io';

void main() {
  stdout.write('Ingrese su código: ');
  final String codigo = stdin.readLineSync()!;
  /**
   * (mapa) Es una función anónima
   * Se crea la función callback
   */
  buscarUsuario(codigo, mostrarDatos);
}

///Tipo de dato es Function
void buscarUsuario(String codigo, Function callback) {
  Map<String, dynamic> mapa = {'nombre': 'David', 'Codigo': codigo};
  callback(mapa);
  // mostrarDatos(mapa);
}

///Forma secundaria sacada de c++
void mostrarDatos(Map x) {
  print(x);
}

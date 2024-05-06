import 'dart:io';

void main() {
  File documento = new File(
      Directory.current.path + '\\04-Tipos-nocomunes\\document\\documento.txt');
  Future<String> leer = Future.delayed(Duration(seconds: 3), () {
    print('Inicio de la operación');
    return documento.readAsString();
    //readASString: Leer un archivo
    //readASStringSync: Leer un archivo de forma asíncrono
  });
  //Future<String> leer = documento.readAsString();
  // String leer = documento.readAsStringSync();
  //Se puede colocar un catchError en el .then
  leer.then(print).catchError((error) => print('El error es: $error'));
  // print(leer);

  // print('Inicio de la operación ');
}

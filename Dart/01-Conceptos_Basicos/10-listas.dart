import 'dart:io';

void main() {
  List<String> lista = [];
  for (int i = 0; i < 3; i++) {
    stdout.write("Ingrese un dato: ");
    lista.add(stdin.readLineSync()!);
  }
  lista.add("hola");
  print(lista);

  //ELIMINAR UN ELEMENTO
  lista.remove("hola"); //por nombre
  lista.removeAt(2); //por indice
  print(lista);

  //ENCONTRAR UN ELEMENTO
  // ignore: unused_local_variable
  int i = lista.indexOf("yutu"); //Retorna el indice o -1
  // ignore: unused_local_variable
  bool veri = lista.contains("face");

  //ORDENAMIENTO
  List<int> numeros = [1, 3, 5, 2, 7, -1, 0];
  numeros.sort();
  print(numeros);
  List<int> numeros2 = (numeros.reversed).toList();
  print(numeros2);

  //LONGITUD DE LA LISTA:
  print(numeros.length);
}

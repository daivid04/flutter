import 'dart:io';

void main() {
  List<String> lista = [];
  int n;
  stdout.write("La cantidad de valores: ");
  n = int.tryParse(stdin.readLineSync()!) ?? 0;
  for (int i = 0; i < n; i++) {
    stdout.write("Ingrese el texto ${i + 1}: ");
    lista.add(stdin.readLineSync()!);
  }
  List<String> palabras = [];
  for (int i = 0; i < n; i++) {
    palabras.addAll(lista[i].split(' '));
  }
  palabras.removeWhere((palabra) => palabra.trim().isEmpty);
  List<String> lista2 = [];
  int suma;
  List<int> lista3 = [];
  int m = palabras.length;
  for (int i = 0; i < m; i++) {
    suma = 0;
    if (!lista2.contains(palabras)) {
      for (int l = i; l < m; l++) {
        if (palabras[i] == palabras[l]) {
          suma++;
        }
      }
      lista2.add(palabras[i]);
      lista3.add(suma);
    }
  }
  print(palabras);
  print(lista2);
  // for (int i = 0; i < lista2.length; i++) {
  //   print("${lista2[i]}: ${lista3[i]}");
  // }
}

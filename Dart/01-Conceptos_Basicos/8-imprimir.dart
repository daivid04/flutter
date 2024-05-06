import 'dart:io';

void main() {
  List<List<int>> matriz = [];
  List<int> fila = [];
  int valor;
  int iterar = 2;
  for (int i = 0; i < iterar; i++) {
    for (int j = 0; j < iterar; j++) {
      stdout.write("Ingrese un dato: (${i + 1}, ${j + 1}) ");
      valor = int.tryParse(stdin.readLineSync()!) ?? 0;
      fila.add(valor);
    }
    matriz.add(fila);
  }
  //print Te imprime por arreglos
  print(matriz);

  // Por for, te imprime por elementos
  for (int i = 0; i < iterar; i++)
    for (int j = 0; j < iterar; j++) print("imprimir: ${matriz[i][j]}");

  //For Each
  matriz.forEach((fila) {
    fila.forEach((columna) => print);
  });
  print('\n');
  //For con join
  matriz.forEach((fila) {
    print("Numeros: ${fila.join(', ')}");
  });
}

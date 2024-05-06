void main() {
  List<int> lista = [1, 2, 3, 4, 5];
  List<int> lista2 = [];
  List<int> lista3 = [3, 1, 2, 15, -10];
  List<String> nombre = ['David', 'Fernando'];

  print(lista.length);
  print(lista.first);
  //Pregunta si la lista esta vacía
  print(lista2.isEmpty);
  //Lo vuelve un mapa
  print(lista3.asMap());
  //Te devuelve el indice de lo que buscamos, si no lo encuentra retornar -1
  print(lista3.indexOf(2));
  //Devuelve el indice de un arreglo a base de una condición
  int num = lista3.indexWhere((int numero) => numero > 4);
  print(lista3[num]);
  //Creas un iterable a base de una condición
  print(lista3.where((int numero) => numero >= 3));
  //Remueves valores a base de un rango
  lista.removeWhere((int numero) => numero < 3);
  //Remueve de forma aleatoria
  lista.shuffle();
  //Ordenar
  lista3.sort();
  print(lista3);
  //Invierte la lista
  print(lista3.reversed.toList());
  //For each iteras cada valor del arreglo
  nombre.forEach((String valor) => print(valor.toUpperCase()));
  //Crea una nueva lista con todos los valores pero los puedes modificar
  final ga = nombre.map((String valor) => valor = valor.toUpperCase()).toList();
  print(ga);
}

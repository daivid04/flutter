main() {
  /*
  Final: Se puede modificar la lista con los métodos
  Const: No se puede modificar en ningún momento
  late: Se puede inicializar en otro momento, en cambio final y const en el 
  mismo momento
  Final late: Se puede inicializar en otro memento, pero solo se puede asignar 
  una sola vez
  Los dos parecido, porque al crear no se puede modificar, sin embargo, Const 
  debe ser creado antes de compilación
  */
  final List<String> lista = ['David', 'Jorge'];
  const List<String> lista2 = ['David', 'Jorge'];
  lista.add('Josue');
  print(lista2);
  late int numero = 5;
  print(numero);
}

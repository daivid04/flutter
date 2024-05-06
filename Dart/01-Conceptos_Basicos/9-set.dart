void main() {
  //Set es un conjunto
  Set<int> conjuntoImpar = {1, 3, 5, 7, 9};
  Set<int> conjuntoPar = {0, 2, 4, 6, 8};
  Set<int> conjuntoRandom = {6, 8, 7, 9,11,-2};
  
  //OPERACIONES CON SET
  Set<int> union = conjuntoImpar.union(conjuntoPar);
  Set<int> interseccion = union.intersection(conjuntoRandom);
  Set<int> diferencia = union.difference(conjuntoRandom);
  conjuntoPar.add(6);

  //VERIFICAR 
  bool veri = conjuntoPar.contains(8); //Verifica si contiene un elemento
  print(veri);
  // List<int> lista = conjuntoImpar.toList(); //Transformas de set a lista
  print("Union: $union");
  print("Interseccion: $interseccion");
  print("diferencia $diferencia");
}

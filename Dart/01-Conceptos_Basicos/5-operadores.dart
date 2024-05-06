void main() {
  //Operadores de asignación
  int? a;
  int b = 8;
  int? c;
  // c ??= 4; //Si la variable es nula se le asigna el valor
  String respuesta = b > 5 ? '3' : '7'; // True : False
  int d = c ?? a ?? 5;
  print("""
    $a $b $c $respuesta $d
  """);
  print(b == d);
  //Operaciones relacionales
  /**
   * ' <   Menor que
   * ' >   Mayor que
   * ' <=  Menor igual
   * ' >=  Mayor igual
   * ' ==  Igual
   * ' !=  Diferencia
   */
  //Operador de tipo
  print('Esto es ${b is double}');
  String t = b is double ? 'C es nulo' : 'C no es la respuesta correcta';
  print(t);
}

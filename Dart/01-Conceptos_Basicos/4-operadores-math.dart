void main() {
  int a = 5;
  int b = 2;
  // a = b++; a = 2 y b = 3
  // a = ++b; a 3 y b = 3
  print(b);
  print(a);
  final int resultado1 = a + b;
  final int resultado2 = a - b;
  final int resultado3 = a * b;
  final double resultado4 = a / b;
  final int resultado5 = a % b;
  final int resultado6 = a ~/ b;

  /// ~/ El resultado es la parte entera

  print("""
  Suma             : $resultado1
  Resta            : $resultado2
  Multiplicación   : $resultado3
  División         : $resultado4
  Resto            : $resultado5
  División(entero) : $resultado6
  """);
}

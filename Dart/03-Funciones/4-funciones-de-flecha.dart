// ignore_for_file: unused_local_variable

void main() {
  ///Ejemplo 1:
  int a = 5;
  int b = 3;
  final suma = (a, b) => a + b;
  ;

  ///Ejemplo 2:
  List<String> Nombres = ['David', 'Jose', 'Manuel', 'Russel', 'Fernando'];
  //.where Solo quiero que nos retorne los valores que cumplen la condición
  var Nombres2 = Nombres.where((n) => (n.length <= 5));
  print(Nombres2.toList());
}

// int suma(int x, int y) => x + y;

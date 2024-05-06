class location {
  final double x;
  final double y;

  const location(this.x, this.y);
}
/**
 * Se crea un constructor constante para que no se pueda modificar ninguna propiedad
 * Además, comparten la misma instancia en memoria
 */

void main() {
  final local1 = location(3.1512, 4.52135);
  final local2 = location(3.1512, 4.52137);
  final local3 = location(3.1512, 4.52137);
  print(local1 == local2);
  print(local2 == local3);
  const local4 = location(3.1512, 4.52135);
  const local5 = location(3.1512, 4.52137);
  const local6 = location(3.1512, 4.52137);
  print(local4 == local5);
  print(local5 == local6);
}

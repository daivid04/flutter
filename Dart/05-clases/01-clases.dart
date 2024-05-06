import 'clases/persona.dart';

void main() {
  final humano1 = new persona.nombre(nombre: "jorge");
  final humano2 = new persona.apellido(apellido: 'Montoya');
  final humano3 = new persona(nombre: 'David', apellido: "Montoya");
  //..edad = 18; No se puede porque la propiedad es privada
  print(humano1);
  print(humano2);
  print(humano3);
}

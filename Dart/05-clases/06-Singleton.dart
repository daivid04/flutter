import 'clases/mi-servicio.dart';

void main() {
  final v1 = MiServicio();
  v1.pedirDatos();
  final v2 = MiServicio();
  v2.pedirDatos();
  print(v1 == v2);
  print(v1);
  print(v2);
}

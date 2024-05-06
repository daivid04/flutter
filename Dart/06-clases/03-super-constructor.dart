class persona {
  late String nombre;
  late int edad;
  persona(this.nombre, this.edad);
  void imprimir() => print({'Nombre': nombre, 'Edad': edad});
}

/**
 * el constructor con super es para llamar a las propiedades del constructor padre
 */
class cliente extends persona {
  late String mesa;
  cliente(super.nombre, super.edad, this.mesa);
  // cliente(String nombreCliente, int edadCliente, String mesaCliente)
  //     : super(nombreCliente, edadCliente);
}

void main() {
  final cliente1 = new cliente('David', 19, '5');
  cliente1.imprimir();
}

class persona {
  late String nombre;
  late int edad;
  persona(this.nombre, this.edad);
  void imprimir() => print({'Nombre': nombre, 'Edad': edad});
}

class cliente extends persona {
  late String mesa;
  cliente(super.nombre, super.edad, this.mesa);

  @override
  void imprimir() => print({'Nombre': nombre, 'Edad': edad, 'Mesa': mesa});
}

void main() {
  final cliente1 = new cliente('David', 19, '5');
  cliente1.imprimir();
}

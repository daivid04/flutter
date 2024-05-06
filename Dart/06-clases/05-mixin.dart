//
mixin ropa {
  late String tela;
  late String talla;
  void crearRopa(tela, ropa) =>
      print('Creando ropa de $tela de la talla $talla');
}

class trenInferior with ropa {
  late String tipo;
  trenInferior(this.tipo, String tela, String talla) {
    super.tela = tela;
    super.talla = talla;
  }
  mostrarDatos() => print('Tela: $tela, Tipo: $tipo');
}

class short extends trenInferior with ropa {
  short(super.tipo, super.tela, super.talla);
}

void main() {
  final short1 = new short('Deportivo', 'Algodón', 'Small');
  short1.crearRopa('Algodón', 'Small');
}

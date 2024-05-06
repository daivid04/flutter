class vehiculo {
  late String codigo;
  late bool encendido;

  vehiculo(this.codigo);
  void encender() {
    encendido = true;
    print('Encendiendo');
  }

  void apagar() {
    encendido = false;
    print('Apagando');
  }
}

class moto extends vehiculo {
  moto(super.codigo);
}

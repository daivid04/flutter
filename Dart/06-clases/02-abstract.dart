/**
 * Abstract hace que no se pueda crear una instancia de la clase padre.
 * Podemos crear métodos que lo inicializamos en la clase hija
 */
abstract class vehiculo {
  late String codigo;
  late bool encendido;

  void encender() {
    encendido = true;
    print('Encendiendo');
  }

  void apagar() {
    encendido = false;
    print('Apagando');
  }

  void revisarEstado();
}

class moto extends vehiculo {
  @override
  void revisarEstado() {
    if (encendido == true) {
      print('Esta encendido');
    } else {
      print('Está apagado');
    }
  }
}

void main() {
  final objeto = new moto();
  objeto.encender;
  objeto.apagar;
}

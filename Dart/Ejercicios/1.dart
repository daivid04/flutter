import 'dart:io';

abstract class vehiculos {
  late String placa;
  late String marca;
  late String tipo;
  vehiculos(this.placa, this.marca, this.tipo);

  factory vehiculos.CrearVehiculo(String tipo, String placa, String marca) {
    tipo = tipo.toLowerCase();
    if (tipo == "auto") {
      int cantidad;
      stdout.write("Ingrese un dato");
      cantidad = int.tryParse(stdin.readLineSync()!) ?? 0;
      return auto(placa, marca, cantidad);
    } else {
      String tipoAsiento;
      stdout.write("Ingrese el tipo de Asiento: ");
      tipoAsiento = stdin.readLineSync()!;
      return moto(placa, marca, tipo, tipoAsiento);
    }
  }
  void mostrarDatos() {
    print("Marca: $marca\nPlaca: $placa");
  }
}

class auto extends vehiculos {
  late int cantCapacidad;
  String tipo = "Auto";
  auto(String placa, String marca, this.cantCapacidad)
      : super(placa, marca, "Auto") {}

  @override
  void mostrarDatos() {
    super.mostrarDatos();
    print("Cantidad de asientos: $cantCapacidad");
  }
}

class moto extends vehiculos {
  late String tipoAsiento;
  String tipo = "Moto";
  moto(String placa, String marca, String tipo, this.tipoAsiento)
      : super(placa, marca, "Moto") {}

  @override
  void mostrarDatos() {
    super.mostrarDatos();
    print("Tipo de asiento: $tipoAsiento");
  }
}

void main() {
  String tipo, placa, marca;
  print("BIENVENIDO A LA PAGINA DE VEHICULOS: ");
  tipo = texto("Ingrese el tipo de vehiculo: ");
  placa = texto("Ingrese la placa: ");
  marca = texto("Ingrese la marca: ");
  vehiculos ga = vehiculos.CrearVehiculo(tipo, placa, marca);
  ga.mostrarDatos();
}

String texto(String algo) {
  stdout.write(algo);
  return stdin.readLineSync()!;
}

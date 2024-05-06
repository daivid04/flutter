import 'dart:io';

class MiServicio {
  late String nombre;
  late String edad;
  late String cuentaBancaria;
  static final MiServicio _singleton = new MiServicio._internal();
  MiServicio._internal();

  factory MiServicio() => _singleton;

  pedirDatos() {
    stdout.write('Ingrese su nombre');
    this.nombre = stdin.readLineSync()!;
    stdout.write('Ingrese su edad');
    this.edad = stdin.readLineSync()!;
    stdout.write('Ingrese su cuenta bancaria');
    this.cuentaBancaria = stdin.readLineSync()!;
  }

  @override
  String toString() {
    return {'Nombre': nombre, 'Edad': edad, 'Cuenta bancaria': cuentaBancaria}
        .toString();
  }
}

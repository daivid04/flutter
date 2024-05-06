import 'dart:io';

mixin fechaEntrega {
  void Entrega() {
    final fecha = new DateTime.now();
    int numeroDia = fecha.weekday;
    late String diaPedido;
    //Dia de entrega sera un plazo de dos días
    int entrega = (numeroDia + 2) % 7;
    if (entrega == 0 && entrega == 6) {
      entrega = 1;
    }
    late String diaEntrega;

    diaPedido = _diaString(numeroDia);
    diaEntrega = _diaString(entrega);
    print("Se solicita el dia $diaPedido y se debe entregar el $diaEntrega");
  }

  //Devuelve el dia de la semana como un texto
  String _diaString(int numeroDia) {
    late String dia;
    switch (numeroDia) {
      case 1:
        dia = 'Lunes';
        break;
      case 2:
        dia = 'Martes';
        break;
      case 3:
        dia = 'Miercoles';
        break;
      case 4:
        dia = 'Jueves';
        break;
      case 5:
        dia = 'Viernes';
        break;
      case 6:
        dia = 'Sabado';
        break;
      case 7:
        dia = 'Domingo';
        break;
    }
    return dia;
  }
}

class libro {
  late String _nombre, _editorial;
  late int _fecha, _paginas;

  String get nombre {
    return _nombre;
  }

  void llenarDatos() {
    stdout.write('Nombre del libro:');
    _nombre = stdin.readLineSync()!;
    stdout.write('Editorial: ');
    _editorial = stdin.readLineSync()!;
    stdout.write('Fecha de Publicacion: ');
    _fecha = int.tryParse(stdin.readLineSync()!) ?? 0;
    stdout.write('Paginas: ');
    _paginas = int.tryParse(stdin.readLineSync()!) ?? 0;
  }

  void mostrarDatos() {
    print('DATOS DEL LIBRO\n');
    print('Nombre: $_nombre\n');
    print('Editorial: $_editorial\n');
    print('Fecha: $_fecha\n');
    print('Paginas: $_paginas\n');
  }
}

class biblioteca with fechaEntrega {
  final List<libro> libros = [];
  final Map<String, List<libro>> prestamos = {};

  biblioteca();

  void llenarLibros(libro nuevoLibro) {
    libros.add(nuevoLibro);
  }

  void prestar(String nombreLibro, String usuario) {
    late bool veri;
    late libro aux;
    veri = libros.any((libro libroPrestar) {
      aux = libroPrestar;
      return libroPrestar.nombre == nombreLibro;
    });
    //Preguntamos si contiene la clave del usuario
    libros.remove(aux);
    if (veri == false) {
      print('EL libro no se encuentra');
      return;
    }
    if (prestamos.containsKey(usuario)) {
      prestamos[usuario]!.add(aux);
    } else {
      prestamos[usuario] = [aux];
    }
    print("Prestamos exitosa");
    Entrega();
  }

  void devolver(String libroDevolver, String usuario) {
    late libro aux;
    if (prestamos.containsKey(usuario)) {
      //Preguntamos si el estudiante pidió prestado con una función .any
      bool veri = prestamos[usuario]!.any((libro libroP) {
        aux = libroP;
        return libroP.nombre == libroDevolver;
      });
      if (veri) {
        prestamos[usuario]!.remove(aux);
        libros.add(aux);
      }
      //SEGUNDA OPCIÓN
      /*for (libro libroP in prestamos[usuario]!) {
        if (libroP.nombre == libroDevolver.nombre) {
          prestamos[usuario]!.remove(libroDevolver);
          libros.add(libroDevolver);
          veri = true;
          break;
        }
      }*/
      else {
        print('No se tiene registro de un prestamo al estudiante $usuario');
      }
    } else {
      print('No se tiene registro del estudiante');
    }
  }
}

void main() {
  final pagina = new biblioteca();

  for (int i = 0; i < 5; i++) {
    libro libroNuevo = new libro();
    libroNuevo.llenarDatos();
    pagina.llenarLibros(libroNuevo);
  }

  late int op;
  String estudiante;
  late String nuevoLibro;
  do {
    print('1.- Prestar\n2.- Devolver libro\n 3.-Salir');
    stdout.write('Opcion: ');
    op = int.tryParse(stdin.readLineSync()!) ?? 4;
    late String libroDevolver;
    switch (op) {
      case 1:
        stdout.write('Nombre del estudiante: ');
        estudiante = stdin.readLineSync()!;
        stdout.write('Nombre del libro: ');
        nuevoLibro = stdin.readLineSync()!;
        pagina.prestar(nuevoLibro, estudiante);
        break;
      case 2:
        stdout.write('Nombre del estudiante: ');
        estudiante = stdin.readLineSync()!;
        stdout.write('Nombre del libro a devolver: ');
        libroDevolver = stdin.readLineSync()!;
        pagina.devolver(libroDevolver, estudiante);
        break;
      case 3:
        print('Gracias por su visita');
        break;
      default:
        print('Opcion invalida intente de nuevo\n');
        break;
    }
  } while (op == 3);
}

void main() async {
  try {
    print('Bienvenido a esta base de datos');
    String dato = await dataUser();
    print(dato);
  } catch (error) {
    print('Hubo un error\n$error');
  }
}

Future<String> dataUser() {
  // return Future.delayed(const Duration(seconds: 5), () {
  //   return """
  // Nombre: David
  // Edad: 19
  // Estado: Soltero""";
  // });
  return Future.delayed(
      const Duration(seconds: 5), () => throw 'Usuario no encontrado');
}

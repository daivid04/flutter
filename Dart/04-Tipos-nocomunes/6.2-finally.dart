void main() async {
  print('Inicio del programa');
  try {
    final value = await httpGet('www.Facebook.com');
    print('Exito de petición $value');
  } on Exception catch (error) { //Se puede agregar un "on" para controlar cada tipo de error
    print('Hubo un error pequeño $error');
  } catch (error) {
    print('error controlado: $error');
  } finally { //Se ejecuta al final del futuro
    print('Final del futuro');
  }
  print('Final del programa');
}

Future<String> httpGet(String url) async {
  await Future.delayed(Duration(seconds: 1));
  throw Exception('Falta de espacio');
  // throw 'Error de petición';
}

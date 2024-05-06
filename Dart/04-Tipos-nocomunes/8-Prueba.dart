void main() {
  try {
    // Este es un código que puede lanzar una excepción
    var a = 7;
    var b = 0;
    print(
        a ~/ b); // Esto lanzará una excepción (IntegerDivisionByZeroException)
  } catch (e) {
    // Aquí manejamos la excepción
    print('Se produjo un error: $e');
  }
}

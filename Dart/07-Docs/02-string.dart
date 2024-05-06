void main() {
  String nombre = "David";
  String apellido = "Montoya";
  String nombreCompleto = '$nombre' ' ' '$apellido';
  //Cantidad de letras
  print(nombre.length);

  print(nombreCompleto.contains('i'));
  print(nombreCompleto.endsWith('a'));
  //Rellena para que tenga 14 caracteres por la izquierda
  print(nombreCompleto.padLeft(14, '...'));
  //Rellena para que tenga 14 caracteres por la derecha
  print(nombreCompleto.padRight(14, '...'));
  print(nombreCompleto[2]);
  print(nombreCompleto * 2);
  print(nombreCompleto.replaceAll(
      RegExp(r'a'), 'i')); //(lo que quieres cambiar, por que vas a cambiar)
  //un subString
  print(nombreCompleto.substring(nombre.length + 1));
  //Te dice en que posición se encuentra el String
  print(nombreCompleto.indexOf(' '));
  //Te elimina los espacios en blanco del inicio y del final
  print(nombre.trim());
  //Crea una lista a base de un String
  print(nombreCompleto.trim().split(' '));

  //Ejercicio
  nombreCompleto = nombreCompleto.trim();
  print(nombreCompleto[nombreCompleto.length - 1].toUpperCase());
}

// ignore_for_file: unused_local_variable
String mayuscula(String nombre) => nombre.toUpperCase();

Map<String, String> mapaMayus(Map<String, String> mapa) {
  mapa = {...mapa}; //Rompe la referencia
  mapa['nombre'] = mapa['nombre']?.toUpperCase() ?? 'No sea burro';

  ///El ? dice que solo se ejecute esa parte solo si no nulo
  return mapa;
}

void main() {
  ///Por valor: los valores primitivos
  ///Por referencia: Todos los objetos. Por ejemplo, los mapas, listas, instancias de clases
  final String nombre1 = 'David';
  final String nombre2 = mayuscula(nombre1);
  print(nombre1 + ' ' + nombre2);
  Map<String, String> mapa = {'nombre': 'David Montoya'};
  Map<String, String> mapa2 = mapaMayus(mapa);
  print('$mapa  $mapa2');
}

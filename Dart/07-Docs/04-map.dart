void main() {
  Map<String, String> mapa1 = {
    'nombre': 'David',
    'apellido': 'Montoya',
    'Edad': '20'
  };

  final mapa2 = {'ciudad': 'Tacna', 'pais': 'Peru'};

  print(mapa1);
  print(mapa1.length);
  print(mapa1.keys.toList());
  print(mapa1.values.toList());
  mapa1.addAll(mapa2);
  print(mapa1);

  //Borra los valores a base de una condición
  mapa1.removeWhere((key, value) => value.length < 4);
  print(mapa1);

  //Moverse por un mapa
  mapa1.forEach((key, value) => mapa1[key] = value.toUpperCase());
  print(mapa1);

  mapa1 = mapa1.map((key, value) => MapEntry(key, value.toLowerCase()));
  print(mapa1);
}

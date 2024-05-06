import 'dart:convert';

import 'package:http/http.dart' as http;
// import 'package:paquete/class/answer.dart';
import 'package:paquete/class/country.dart';

// void getAnswerService() {
//   final url = Uri.https('reqres.in', '/api/users', {'page': '2'});
//   //Response es la resolución de una solución de una petición http
//   http.get(url).then((http.Response res) {
//     final answer = answerFromJson(res.body);
//     print('page: ${answer.page}');
//     print('per_Page: ${answer.perPage}');
//     print('id tercer elemento: ${answer.data[2].id}');
//     // final body = jsonDecode(res.body);
//     // print('page: ${body["page"]}');
//     // print('per_page: ${body["per_page"]}');
//     // print('id del tercer elemento: ${body["data"][2]["id"]}');
//   });
// }

void geCountryService() {
  final url = Uri.parse('https://restcountries.com/v2/alpha/col');
  http.get(url).then((http.Response json) {
    final country = countryFromJson(json.body);
    print('================================');
    print('Pais: ${country.name}');
    print('Poblacion: ${country.population}');
    print('Frontera:');
    for (String frontera in country.borders) {
      print('   $frontera');
    }
    print('Lenguaje: ${country.languages.nativeName}');
    print('Latitud ${country.latlng[0]}');
    print('Latitud ${country.latlng[1]}');
    print('Moneda: ${country.currencies.name}');
    print('Bandera: ${country.flag}');
  });
}

import 'dart:convert';
import 'package:paquete/class/currencies.dart';
import 'package:paquete/class/flags.dart';
import 'package:paquete/class/lenguages.dart';
import 'package:paquete/class/regional_blocs.dart';
import 'package:paquete/class/translations.dart';

Country countryFromJson(String json) => Country.fromJson(jsonDecode(json));

String countryToJson(Country mapa) => jsonEncode(mapa.toJson());

class Country {
  String name;
  String topLevelDomain;
  String alpha2Code;
  String alpha3Code;
  String callingCodes;
  String capital;
  List<String> altSpellings;
  String subregion;
  String region;
  int population;
  List<double> latlng;
  String demonym;
  double area;
  double gini;
  String timezones;
  List<String> borders;
  String nativeName;
  String numericCode;
  Flags flags;
  Currencies currencies;
  Languages languages;
  Translations translations;
  String flag;
  List<Regional> regionalblocs;
  String cioc;
  bool independent;

  Country(
      {required this.name,
      required this.topLevelDomain,
      required this.alpha2Code,
      required this.alpha3Code,
      required this.callingCodes,
      required this.capital,
      required this.altSpellings,
      required this.subregion,
      required this.region,
      required this.population,
      required this.latlng,
      required this.demonym,
      required this.area,
      required this.gini,
      required this.timezones,
      required this.borders,
      required this.nativeName,
      required this.numericCode,
      required this.flags,
      required this.currencies,
      required this.languages,
      required this.translations,
      required this.flag,
      required this.regionalblocs,
      required this.cioc,
      required this.independent});

  factory Country.fromJson(Map<String, dynamic> json) => Country(
      name: json['name'],
      topLevelDomain: json['topLevelDomain'][0],
      alpha2Code: json['alpha2Code'],
      alpha3Code: json['alpha3Code'],
      callingCodes: json['callingCodes'][0],
      capital: json['capital'],
      altSpellings: List<String>.from(json['altSpellings']),
      subregion: json['subregion'],
      region: json['region'],
      population: json['population'],
      latlng: List<double>.from(json['latlng']),
      demonym: json['demonym'],
      area: json['area'],
      gini: json['gini'],
      timezones: json['timezones'][0],
      borders: List<String>.from(json['borders']),
      nativeName: json['nativeName'],
      numericCode: json['numericCode'],
      flags: Flags.fromJson(json['flags']),
      currencies: Currencies.fromJson(json['currencies'][0]),
      languages: Languages.fromJson(json['languages'][0]),
      translations: Translations.fromJson(json['translations']),
      flag: json['flag'],
      regionalblocs: List<Regional>.from(json['regionalBlocs'].map((X) => Regional.fromJson(X))),
      cioc: json['cioc'],
      independent: json['independent']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'topLevelDomain': topLevelDomain,
        'alpha2Code': alpha2Code,
        'alpha3Code': alpha3Code,
        'callingCodes': callingCodes,
        'capital': capital,
        'altSpellings': altSpellings,
        'subregion': subregion,
        'region': region,
        'population': population,
        'latlng': latlng,
        'demonym': demonym,
        'area': area,
        'gini': gini,
        'timezones': timezones,
        'borders': borders,
        'nativeName': nativeName,
        'numericCode': numericCode,
        'flags': flags,
        'currencies': currencies,
        'languages': languages,
        'translations': translations,
        'flag': flag,
        'regionalblocs': regionalblocs,
        'cioc': cioc,
        'independent': independent
      };
}

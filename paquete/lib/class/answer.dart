// To parse this JSON data, do
//
//     final answer = answerFromJson(jsonString);

import 'dart:convert';

import 'package:paquete/class/suppot.dart';
import 'package:paquete/class/user.dart';

Answer answerFromJson(String json) => Answer.fromJson(jsonDecode(json));

String answerToJson(Answer mapa) => jsonEncode(mapa.toJson());

/*
jsonDecode(): De json a mapa
jsoEncode: De mapa a json
*/

class Answer {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<User> data;
  Support support;

  Answer({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });
  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        page: json['page'],
        perPage: json['per_page'],
        total: json['total'],
        totalPages: json['total_pages'],
        data: List<User>.from(json['data'].map((x) => User.fromJson(x))),
        support: Support.fromJson(json['support']),
      );

  Map<String, dynamic> toJson() => {
        'page': page,
        'per_page': perPage,
        'total': total,
        'total_pages': totalPages,
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
        'support': support.toJson(),
      };
}

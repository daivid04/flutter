import 'dart:convert';

import 'package:yobo_app/domain/entities/entities.dart';

OpinionsPostModel opinionsPostModelFromJson(String str) =>
    OpinionsPostModel.fromJson(jsonDecode(str));

String opinionsPostModelToJson(OpinionsPostModel json) =>
    jsonEncode(json.toJson());

class OpinionsPostModel {
  final List<Opinions> opinions;

  OpinionsPostModel({required this.opinions});

  factory OpinionsPostModel.fromJson(Map<String, dynamic> json) =>
      OpinionsPostModel(
          opinions: List<Opinions>.from(
              json['opiniones'].map((data) => Opinions.fromJson(data))));

  List<OpinionsPost> toOpinionsPost() => List<OpinionsPost>.from(
      opinions.map((opinion) => opinion.toOpinionPost()));

  Map<String, dynamic> toJson() =>
      {'opinions': List<dynamic>.from(opinions.map((x) => x.toJson()))};
}

Opinions opinionsFromEntities(OpinionsPost opinion) => Opinions(
    productId: opinion.productId,
    opinion: opinion.opinion,
    qualification: opinion.qualification,
    user: opinion.user,
    date: opinion.date,
    category: opinion.category);

class Opinions {
  final int productId;
  final String opinion;
  final double qualification;
  final String user;
  final String date;
  final String category;

  Opinions({
    required this.productId,
    required this.opinion,
    required this.qualification,
    required this.user,
    required this.date,
    required this.category,
  });

  factory Opinions.fromJson(Map<String, dynamic> json) => Opinions(
        productId: json['productoId'],
        opinion: json['opinion'],
        qualification: json['calificacion'],
        user: json['usuario'],
        date: json['fecha'],
        category: json['categoria'],
      );
  OpinionsPost toOpinionPost() => OpinionsPost(
      opinion: opinion,
      user: user,
      date: date,
      category: category,
      productId: productId,
      qualification: qualification);

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'opinion': opinion,
        'qualification': qualification,
        'user': user,
        'date': date,
        'category': category
      };
}

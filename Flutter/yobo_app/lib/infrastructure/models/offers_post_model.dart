import 'dart:convert';

import 'package:yobo_app/domain/entities/offers_post.dart';

OffersPostModel offersPostModelFromJson(String str) =>
    OffersPostModel.fromJson(jsonDecode(str));

class OffersPostModel {
  final List<Offer> listOffers;

  OffersPostModel({required this.listOffers});

  factory OffersPostModel.fromJson(Map<String, dynamic> json) =>
      OffersPostModel(
          listOffers: List<Offer>.from(
              json['ofertas'].map((data) => Offer.fromJson(data))));
}

class Offer {
  final String start;
  final String end;
  final int discount;
  String? event;

  Offer({
    required this.start,
    required this.end,
    required this.discount,
    this.event,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
      start: json['fecha_inicio'],
      end: json['fecha_fin'],
      discount: json['porcentaje_descuento'],
      event: json['evento']);

  OffersPost toOfferPost() =>
      OffersPost(start: start, end: end, discount: discount, event: event);
}

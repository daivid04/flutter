import 'dart:convert';

import 'package:yobo_app/domain/entities/products_post.dart';

ProductPostModel productPostModelFromJson(String str) =>
    ProductPostModel.fromJson(jsonDecode(str));

String productPostModelToJson(ProductPostModel data) => jsonEncode(data.toJson());

class ProductPostModel {
  final List<Product> products;

  ProductPostModel({required this.products});

  factory ProductPostModel.fromJson(Map<String, dynamic> json) =>
      ProductPostModel(
          products: List<Product>.from(
              json['products'].map((x) => Product.fromJson(x))));

  List<ProductsPost> toProductPost() =>
      List<ProductsPost>.from(products.map((data) => data.toProductsPost()));

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  final int id;
  final int idCategory;
  final String name;
  final String description;
  final double price;
  final double assessment;
  final String url;
  final int stock;

  Product(
      {required this.id,
      required this.idCategory,
      required this.name,
      required this.description,
      required this.price,
      required this.assessment,
      required this.url,
      required this.stock});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json['id'],
      idCategory: json['idCategory'],
      name: json['nombre'],
      description: json['descripcion'],
      price: json['precio'],
      assessment: json['valoracion'],
      url: json['imagenes'],
      stock: json['stock']);

  ProductsPost toProductsPost() => ProductsPost(
      id: id,
      idCategory: idCategory,
      name: name,
      description: description,
      price: price,
      assessment: assessment,
      url: url,
      stock: stock);

  Map<String, dynamic> toJson() => {
        "id": id,
        "idCategory": idCategory,
        "nombre": name,
        "descripcion": description,
        "precio": price,
        "valoracion": assessment,
        "imagenes": url,
        "stock": stock,
      };
}

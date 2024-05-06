import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:yobo_app/domain/entities/categories_post.dart';

const iconos = <String, IconData>{
  "phone_android" : Icons.phone_android,
  "shopping_bag" : Icons.shopping_bag_outlined,
  "home" : Icons.home,
  "face" : Icons.face, 
  "sports_soccer" : Icons.sports_soccer_outlined,
   "menu_book" : Icons.menu_book_rounded,
   "toys" : Icons.toys_outlined,
   "directions_car" : Icons.directions_car_filled_outlined,
   "local_dining" : Icons.local_dining
};

CategoriesPostModel categoriesFromJson(String str) =>
    CategoriesPostModel.fromJson(json.decode(str));

class CategoriesPostModel {
  final List<Category> categories;

  CategoriesPostModel({required this.categories});

  factory CategoriesPostModel.fromJson(Map<String, dynamic> json) =>
      CategoriesPostModel(
          categories: List<Category>.from(
              json['categories'].map((x) => Category.fromJson(x))));

  List<CategoriesPost> toCategoriesPost() =>
      List<CategoriesPost>.from(categories.map((x) => x.toCategoriesPost()));
}

class Category {
  final String label;
  final IconData icon;

  Category({required this.label, required this.icon});

  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(label: json['nombre'], icon: iconos[json['icono']]!);

  CategoriesPost toCategoriesPost() => CategoriesPost(label: label, icon: icon);
}

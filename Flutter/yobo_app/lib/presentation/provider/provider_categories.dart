import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yobo_app/domain/entities/categories_post.dart';
import 'package:yobo_app/infrastructure/models/categories_post_model.dart';

class ProviderCategories extends ChangeNotifier {
  final List<CategoriesPost> listCategories = [];

  Future<void> leadCategory() async {
    String json = await rootBundle.loadString('assets/categories_data.json');
    listCategories.addAll(categoriesFromJson(json).toCategoriesPost());
    notifyListeners();
  }
}

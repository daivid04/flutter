import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yobo_app/domain/entities/entities.dart';
import 'package:yobo_app/infrastructure/models/opinions_post_model.dart';
import 'package:yobo_app/infrastructure/models/products_post_model.dart';

class ProviderProducts extends ChangeNotifier {
  final String urlProduct = 'assets/products_data.json';
  final String urlOpinion = 'assets/opinions_data.json';
  List<ProductsPost> products = [];
  List<List<OpinionsPost>> opinions = [];

  Future<void> leadProducts() async {
    String jsonProduct = await rootBundle.loadString(urlProduct);

    List<ProductsPost> lista =
        (productPostModelFromJson(jsonProduct).toProductPost());
    for (ProductsPost producto in lista) {
      if (!products.any((element) => element.id == producto.id)) {
        products.add(producto);
      }
    }
    // products.addAll(lista);
    notifyListeners();
  }

  Future<void> leadOpinions() async {
    String jsonOpinion = await rootBundle.loadString(urlOpinion);
    List<OpinionsPost> list =
        opinionsPostModelFromJson(jsonOpinion).toOpinionsPost();
    List<OpinionsPost> opiniones;
    for (int i = 0; i < products.length; i++) {
      opiniones = [];
      for (int ii = 0; ii < list.length; ii++) {
        if (list[ii].productId == products[i].id) {
          opiniones.add(list[ii]);
        }
      }
      opinions.add(opiniones);
    }
    
    notifyListeners();
  }

  void addOpinion(OpinionsPost opinion, int id) async {
    //Guardamos la opinion en el producto

    String strOpinion = await rootBundle.loadString(urlOpinion);
    final jsonOpinion = opinionsPostModelFromJson(strOpinion);
    jsonOpinion.opinions.add(opinionsFromEntities(opinion));

    String updatedJsonString = opinionsPostModelToJson(jsonOpinion);
    final File fileOpinions = File(urlOpinion);
    await fileOpinions.writeAsString(updatedJsonString);
    // String updatedJsonString = productPostModelToJson(json);
    // final File file = File(urlProduct);
    // await file.writeAsString(updatedJsonString);
    notifyListeners();
  }
}

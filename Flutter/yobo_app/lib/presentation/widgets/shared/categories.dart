import 'package:flutter/material.dart';
import 'package:yobo_app/presentation/widgets/shared/navigation_bar.dart';

class Categories {
  final String label;
  final IconData icon;
  final String link;

  Categories({required this.label, required this.icon, required this.link});

  IconBar iconCategories(){
    return IconBar(icon: icon, label: label,);
  }
}

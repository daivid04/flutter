import 'package:flutter/services.dart';

class PlaceHolderFormat extends TextInputFormatter {
  final int cant;

  PlaceHolderFormat({required this.cant});
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text;

    if (newText.isEmpty) {
      return newValue.copyWith(text: '');
    }
    final numericValue = int.tryParse(newText);
    if (numericValue == null || numericValue > cant ) {
      return oldValue;
    }
    return newValue;
  }
}

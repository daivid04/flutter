import 'package:intl/intl.dart'; //paquete para los formatos. Se debe instalar el paquete intl

class HumanFormats {
  static String humanReadableNumber(int value) {
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: ''
    ).format(value);
    return formatterNumber;
  }
}

//FORMA ANTIGUA DE HACERLO(COMO LO HICE YO XD)
// String view(int value) {
//   String counter = value.toString();
//   int amount = counter.length;
//   if (amount <= 4) {
//     return counter;
//   } else {
//     String result = ('${counter.substring(0, (amount % 3 == 0) ? 3 : amount % 3)}.${counter[(amount % 3 == 0) ? 3 : amount % 3]}');
//     return (amount > 6) ? '${result}M' : '${result}K';
//   }
// }

import 'dart:io';

void main() {
  stdout.write('Ingrese la base: ');
  int base = int.tryParse(stdin.readLineSync()!) ?? 0;
  for (int i = 0; i < 10; i++) {
    if (i < 9) {
      print('$base x ${i + 1}  = ${base * (i + 1)}');
    } else {
      print('$base x ${i + 1} = ${base * (i + 1)}');
    }
  }
}

void main() {
  forInicial: //Se puede poner un nombre a un ciclo
  for (int i = 0; i < 5; i++) {
    for (int j = 0; i < 5; j++) {
      print('$i, $j');
      if (j == 4) {
        break forInicial;
      }
    }
  }
}

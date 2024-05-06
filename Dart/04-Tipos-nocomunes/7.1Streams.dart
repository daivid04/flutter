import 'dart:math';

void main() {
  // numerosConsecutivos().listen((valor) => print('Valor del Stream es $valor'));
  numerosCubicos().listen((valorCub) => print('Valor cubico es: $valorCub'));
}

Stream<int> numerosConsecutivos() =>
    Stream.periodic(Duration(seconds: 1), (numero) => numero * numero).take(4);
//.take() Cuantos emisiones va a retornar el Stream

//async* Retorna un Stream
Stream<int> numerosCubicos() async* {
  final valor = [1, 2, 3, 4, 5];
  for (int i in valor) {
    await Future.delayed(Duration(seconds: i));
    yield i * i * i; //Va emitiendo valor por valor
  }
}

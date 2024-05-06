import 'dart:collection';
import 'dart:io';

void main() {
  ///Queue: Crea una cola la cual se puede modificar por el inicio y por el final
  Queue<int> cola = new Queue();
  cola.addAll([10, 20, 30, 40, 50]);
  cola.addFirst(0);
  cola.addLast(60);
  Iterator i = cola.iterator; //Da el valor para que puedas modificar
  //Imprimir con un iterator
  while (i.moveNext()) {
    print(i.current); //devuelve el valor actual
  }
  stdout.write('--------------Prueba--------------\n');
  //Imprimir con forEach
  cola.forEach((valores) {
    print('Valor: $valores');
  });
}

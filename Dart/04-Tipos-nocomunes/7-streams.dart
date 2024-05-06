import 'dart:async';

void main() {
  /**
   * Los Streams son una ejecución de forma asíncrona y es de un solo oyente
   * StreamController<String>.broadcast() es para haya más un oyente, osea que 
   * se puede  modificar por más de una lista
   * Creación de un Stream
   * También se puede poner Stream streamCtrl = streamController()
   */
  final streamCtrl = StreamController<String>();
  //Es para señalar lo que hará cada vez que se interactúa el flujo de información
  streamCtrl.stream.listen((dato) => print('Nuevo dato: $dato'),
      onError: (error) => print(error),
      cancelOnError: true,
      onDone: () => print('Buena master'));
  /**
       * onError: cuando se genera un error dentro del stream
       * cancelOnError: si queremos que continue o termine el stream si se halla un error
       * onDone: Cuando se cierre el stream (.close) hacer algo
  */
  streamCtrl.sink
    ..add('Goku')
    ..add('Vegeta')
    ..add('Gohan')
    ..addError('Nombre no identificado')
    ..add('Bills'); //Forma de añadir un nuevo dato al inicio del Stream
  streamCtrl.sink.close(); //Es para terminar el stream, debes estar seguro
  print(streamCtrl);
  print('Hola');
}

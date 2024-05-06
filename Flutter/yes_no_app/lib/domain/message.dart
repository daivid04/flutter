//En el dominio solo se hace código de dart, nada de widget

enum FromWho {
  mine, //Mio
  yours //Tuyo
}

class Message {
  final String text;
  final String? url;
  final FromWho fromWho;

  Message({
    required this.text, 
    this.url, 
    required this.fromWho});
}

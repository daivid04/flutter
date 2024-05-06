import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:yes_no_app/domain/message.dart';

//ChangeNotifier: Puede modificar cuando haya un cambio
class ChatProviders extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: "Hola perra", fromWho: FromWho.mine),
    Message(text: "Que sale hoy?", fromWho: FromWho.mine),
  ];

  Future<void> sedMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.mine);
    messageList.add(newMessage);
    notifyListeners(); //Es lo mismo que el setState(){}
    SchedulerBinding.instance.addPostFrameCallback((_) {
      moveScrollBottom();
    });
    
  }

  void moveScrollBottom() {
    chatScrollController.animateTo(
        //Es como se va a mover el scroll de forma automática
        chatScrollController.position
            .extentTotal, //Le estas diciendo que va agarrar el máximo que puede
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}

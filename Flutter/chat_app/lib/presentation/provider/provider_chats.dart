import 'package:chat_app/config/herpers/get_gif_image.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/domain/entities/message.dart';

class ProviderChats extends ChangeNotifier {
  final scrollController = ScrollController();
  List<Message> listMessage = [
    Message(text: 'Hola amigo', fromWho: FromWho.mine),
  ];

  void addMessage(String message) {
    final newMessage = Message(text: message, fromWho: FromWho.mine);
    listMessage.add(newMessage);

    if (message.endsWith('?')) {
      herReply();
    }

    notifyListeners();
    moveScrollController();
  }

  Future<void> herReply() async {
    final herMessage = await GetGitImage().getAnswer();
    listMessage.add(herMessage);
    notifyListeners();
    moveScrollController();
  }

  Future<void> moveScrollController() async {
    await Future.delayed(const Duration(milliseconds: 100));
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100), curve: Curves.linear);
  }
}

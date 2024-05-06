import 'package:chat_app/domain/entities/message.dart';
import 'package:chat_app/presentation/provider/provider_chats.dart';
import 'package:chat_app/presentation/widgets/chat/my_chat.dart';
import 'package:chat_app/presentation/widgets/chat/your_chat.dart';
import 'package:chat_app/presentation/widgets/shared/chat_shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenChat extends StatelessWidget {
  const ScreenChat({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ProviderChats>();
    return SafeArea(
      child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: chatProvider.scrollController,
              itemBuilder: (context, index) {
                final message = chatProvider.listMessage[index];
                if (message.fromWho == FromWho.mine) {
                  return MyChat(message: message);
                } else {
                  return YourChat(message: message);
                }
            },
            itemCount: chatProvider.listMessage.length,
            )
          ),
          ChatShared(
            onValue: (value) => chatProvider.addMessage(value),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    ));
  }
}

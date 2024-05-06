
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/domain/message.dart';
import 'package:yes_no_app/presentation/providers/chat_providers.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme(
          selectColor: 1
          ).themeBackgroundColor().withOpacity(0.4),
        leading: const Padding(
          //leading: para mostrar un widget antes del título del encabezado
          padding: EdgeInsets.all(5),
          child: CircleAvatar(
            //Poner un avatar en un container circular
            backgroundImage: NetworkImage(
                'https://e.rpp-noticias.io/xlarge/2022/09/01/563756_1308020.jpg',
                scale: 1),
          ),
        ),
        title: const Text('Mi amor ❤️'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProviders>();
    return SafeArea(
      
      //Guarda espacio para los botones que tiene los celulares en la parte inferior
      left:
          false, //En IOS si pones false al girar la pantalla ocupa la parte de la cámara
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              //Expande hasta donde pueda
              child: ListView.builder(
                controller:chatProvider.chatScrollController,
                //Que se muestre los mensajes en tiempo de ejecución
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.mine)
                      ? MyMessageBubble(message: message,)
                      : HerMessageBubble(message: message,);
                },
                itemCount: chatProvider.messageList.length,
              ),
            ),
            MessageFieldBox(onValue: (value) => chatProvider.sedMessage(value),), //Inicializamos el parámetro del MessageFielBox que pide un ValueChanged<String> 
            const SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}

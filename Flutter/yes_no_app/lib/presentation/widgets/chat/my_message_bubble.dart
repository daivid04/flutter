import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;
  const MyMessageBubble({
    super.key, required this.message
  });
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context)
        .colorScheme; //Es para saber que theme esta usando la aplicación
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.primary, borderRadius: BorderRadius.circular(17)),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(message.text,
                  style:const TextStyle(color: Color.fromARGB(255, 255, 255, 255)))),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

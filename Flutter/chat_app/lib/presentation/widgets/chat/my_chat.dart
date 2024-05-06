import 'package:flutter/material.dart';

import 'package:chat_app/domain/entities/message.dart';

class MyChat extends StatelessWidget {
  final Message message;
  const MyChat({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 162, 192, 255)),
          child: Padding(
            padding:const EdgeInsets.symmetric(vertical: 11, horizontal: 17),
            child: Text(
              message.text,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

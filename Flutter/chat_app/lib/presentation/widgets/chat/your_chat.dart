import 'package:flutter/material.dart';

import 'package:chat_app/domain/entities/message.dart';

class YourChat extends StatelessWidget {
  final Message message;
  const YourChat({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 162, 192, 255).withOpacity(0.1)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 17),
            child: Text(
              message.text,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        _ImageBubble(url: message.url!,),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String url;

  const _ImageBubble({required this.url});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(url,
        width: size.width * 0.7,
        height: 200,
        
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.7,
            height: 200,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: const Text('Cargando el gif'),
          );
        },
      ),
    );
  }
}

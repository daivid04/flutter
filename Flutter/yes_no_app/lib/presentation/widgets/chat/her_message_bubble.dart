
import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(17)),
          child: Padding(
              padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(message.text,
                  style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)))),
        ),
        const SizedBox(
          height: 5,
        ),
        _ImageBubble(),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context)
        .size; //MediaQuery: Datos del dispositivo a base del contexto y .size para las medidas
    return ClipRRect(
        //Crea un clip redondeado
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          'https://yesno.wtf/assets/yes/7-653c8ee5d3a6bbafd759142c9c18d76c.gif',
          width: size.width * 0.7,
          height: 200,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              width: size.width * 0.7,
              height: 200,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: const Text('Cargando mensaje de la otra persona'),
            );
          }, //fit: adaptar el multimedia al tamaño del contenedor
        ));
  }
}


//https://yesno.wtf/assets/yes/7-653c8ee5d3a6bbafd759142c9c18d76c.gif
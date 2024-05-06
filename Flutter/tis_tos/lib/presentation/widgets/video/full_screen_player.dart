import 'package:flutter/material.dart';
import 'package:tis_tos/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart'; //paquete que se usa para poder manejar los videos

class FullScreenPlayer extends StatefulWidget {
  final String caption;
  final String videoUrl;
  const FullScreenPlayer(
      {super.key, required this.caption, required this.videoUrl});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() { //Lo que hace al iniciar el video
    super.initState(); //Siempre va primero
    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true) //Que siempre se repite el video al terminar
      ..play(); //se pone play de forma automática
  }

  @override
  void dispose() {
    controller
        .dispose(); //Es para que no se siga reproduciendo videos que no están en pantalla
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        return (snapshot.connectionState != ConnectionState.done)
            ? const Center(
                child: CircularProgressIndicator(
                strokeWidth: 2,
              ))
            : GestureDetector( //Es para detectar los gestos
                onTap: () {
                  if (controller.value.isPlaying) {
                    controller.pause();
                    return;
                  }
                  controller.play();
                },
                child: AspectRatio( //Es el aspecto que va a tener el video
                  aspectRatio: controller.value.aspectRatio, // es el aspecto
                  child: Stack(
                    children: [
                      VideoPlayer(controller), //Este el para mostrar el video
                      const VideoBackground(
                        stops: [0.6,1.0],
                      ), //indicar cual es el video
                      Positioned(
                          bottom: 50,
                          left: 25,
                          child: _VideoCaption(caption: widget.caption))
                    ],
                  ),
                ),
              );
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;
  const _VideoCaption({required this.caption});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: size.width * 0.6,
      child: Text(
        caption,
        maxLines: 2,
        style: titleStyle,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tis_tos/domain/entities/video_post.dart';
import 'package:tis_tos/presentation/widgets/shared/video_player/video_button.dart';
import 'package:tis_tos/presentation/widgets/video/full_screen_player.dart';

class VideoScrollView extends StatelessWidget {
  final List<VideoPost> videos;
  const VideoScrollView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      //Hace como transición entre varios widgets
      scrollDirection: Axis.vertical, //Para cambiar la direccion de scroll
      physics/**Física */: const BouncingScrollPhysics(), //Efecto de revote
      itemBuilder: (context, index) {
        final videoPost = videos[index];
        
        return Stack( //Es para widgets que se sobreponen
          children: [
            SizedBox.expand(
              child: FullScreenPlayer( //Debe ser un stateFull porque cada video debe tener un tiempo de vida
                caption: videoPost.caption,
                videoUrl: videoPost.videoUrl,
              ),
            ),
            Positioned(
              right: 20,
              bottom: 30,
              child: VideoButtons(video: videoPost)),
          ],
        );
      },
      itemCount: videos.length,
    );
  }
}


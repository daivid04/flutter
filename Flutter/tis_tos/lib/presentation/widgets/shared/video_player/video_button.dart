import 'package:animate_do/animate_do.dart'; //Paquete de animaciones
import 'package:flutter/material.dart';
import 'package:tis_tos/config/helpers/human_formats.dart';
import 'package:tis_tos/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;
  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(value: video.likes, iconData: Icons.favorite),
        const SizedBox(height: 5,),
        _CustomIconButton(value: video.views, iconData: Icons.remove_red_eye_outlined),
        const SizedBox(height: 5,),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 3),
          child: const _CustomIconButton(value: 0, iconData: Icons.play_circle_outline))
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final Color color;
  final IconData iconData;
  const _CustomIconButton(
      {required this.value, required this.iconData, Color? iconColor})
      : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(iconData),
          color: color,
          iconSize: 30, //El tamaño del icon
        ),
        if(value > 0)
          Text(HumanFormats.humanReadableNumber(value)),
        
      ],
    );
  }
}

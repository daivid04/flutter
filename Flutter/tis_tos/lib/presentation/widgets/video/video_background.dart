import 'package:flutter/material.dart';

class VideoBackground extends StatelessWidget {
  final List<Color> colors;
  final List<double> stops;
  const VideoBackground({
    super.key, 
    this.colors = const [Colors.transparent, Colors.black87], 
    this.stops = const [0.0,1.0]});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      //Es para poder ocupar todo lo posible
      child: DecoratedBox(
          //Es un contenedor para decorar
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: colors,
                stops: stops, //Es par decir de donde a donde va, en un rango de 0 a 1
                begin: Alignment.center,
                end: Alignment.bottomCenter              
              )
          )
      ),
    );
  }
}

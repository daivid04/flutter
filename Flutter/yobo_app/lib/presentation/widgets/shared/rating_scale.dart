import 'package:flutter/material.dart';

class RatingScale extends StatelessWidget {
  final double rating;

  const RatingScale({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            5,
            (index) {
              double starValue = index + 1.0;
              double iconSize = 24.0;
              if (rating >= starValue) {
                return Icon(Icons.star, size: iconSize, color: Colors.black54);
              } else if (rating > starValue - 1.0) {
                return ClipRect(
                  clipper: FractionalClipper(rating - (starValue - 1.0)),
                  child: Icon(Icons.star, size: iconSize, color: Colors.black54),
                );
              } else {
                return Icon(Icons.star_border, size: iconSize, color: (index < rating) ? Colors.black54 : Colors.transparent);
              }
            },
          ),
        ),
        Text(' $rating')
      ]
    );
  }
}

class FractionalClipper extends CustomClipper<Rect> {
  final double fraction;

  FractionalClipper(this.fraction);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0.0, 0.0, size.width * fraction, size.height);
  }

  @override
  bool shouldReclip(FractionalClipper oldClipper) { //Esto te dice si es necesario recrear el corte o no
    return fraction != oldClipper.fraction;
  }
}

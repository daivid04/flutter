class Square {
  double _side;
  //aserciones
  Square({required double side}) : assert(side > 0, 'side < 0'),  _side = side;

  double get area => _side * _side;

  set side(double value) {
    if (value < 0) throw 'El lado no puede ser menor que 0';
    _side = value;
  }
}

void main() {
  final mySquare = Square(side: -10);
  print(mySquare.area);
}

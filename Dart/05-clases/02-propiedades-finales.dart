import 'dart:math';

class Circulo {
  final int radio;
  final double area;

  ///Circulo(this.radio, this.area); //Una forma de inicializar
  ///Forma correcta de inicializar una variable final
  ///Se ejecuta el procedimiento antes que se cree la instancia
  Circulo(int radio)
      : this.radio = radio,
        this.area = radio * pi;
}

void main() {
  final circulo = new Circulo(5);
  print(circulo.area);
}

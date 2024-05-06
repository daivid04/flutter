class paralelo {
  final int base;
  final int altura;
  final int area;
  final String tipo;
  /**
   * CONSTRUCTOR FACTORY
   * Crear una instancia de una clase dependiendo de una condición
   */
  factory paralelo(base, altura) {
    if (base == altura) {
      return paralelo.cuadrado(base);
    } else {
      return paralelo.rectangulo(base, altura);
    }
  }
  paralelo.rectangulo(this.base, this.altura)
      : this.area = base * altura,
        this.tipo = 'Rectángulo';
  paralelo.cuadrado(this.base)
      : this.altura = base,
        this.area = base * base,
        this.tipo = 'cuadrado';

  @override
  String toString() {
    return {'Altura': altura, 'Base': base, 'Area': area, 'Tipo': tipo}
        .toString();
  }
}

void main() {
  final figura = new paralelo(15, 12);
  print(figura);
}

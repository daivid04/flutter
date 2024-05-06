class herramientas {
  /**
   * STATIC:
   * Hace que la propiedad o el método sea de la clase y no para la instancia 
   * del objeto, con esto se puede acceder sin la necesidad de una instancia
   *  
   */
  static const List<String> mercado = [
    'borrador',
    'goma',
    'lapicero',
    'cuaderno'
  ];
  static void imprimir() => mercado.forEach(print);
}

void main() {
  herramientas.imprimir();
}

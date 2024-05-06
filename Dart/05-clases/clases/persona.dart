class persona {
  //Propiedades
  String? nombre;
  String? apellido;
  int _edad = 18; //Privada _

  /**
   * Getters y setters
   * get: Método que se llama como propiedad, retorna valor
   * Set: Método que se llama como propiedad, establecer un valor y es un void
   */
  String get edad => 'Tiene: ${this._edad} años';
  set edad(Edad) => _edad = Edad;

  //Constructores
  /**
   * Se puede crear constructores por nombres
   * this.variable es para asignar el valor del parámetro a la variable
   */
  //
  persona({required this.nombre, required this.apellido});
  persona.nombre({required this.nombre, this.apellido});
  persona.apellido({this.nombre, required this.apellido});
  //La aserción son condiciones que debe cumplir los constructores
  persona.completa(
      {required this.nombre, required this.apellido, required edad}):assert(edad > 0, 'Edad debe ser mayor que 0') , _edad = edad; 
  //Métodos

  @override //Es un decorador que se usa para poder sobre escribir un método padre
  String toString() =>
      'Nombre: ${this.nombre}\nApellido: ${this.apellido}\n Edad: ${this._edad}';
}

void main() {
  double a = 32.6;
  //valor absoluto
  print("$a: ${a.abs()}");
  //Numero entero mayor que a
  print("$a: ${a.ceil()}");
  //Numero entero menor que a
  print("$a: ${a.floor()}");
  //Redondeo
  print("$a: ${a.round()}");
  print("$a: ${a.clamp(-40, 20)}");
}

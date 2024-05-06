abstract class animal {}

abstract class mammal extends animal {}

abstract class bird extends animal {}

abstract class fish extends animal {}

mixin walk {
  void get caminar => print('Estoy caminando');
}

mixin swim {
  void get nadar => print('Estoy nadando perro');
}

mixin fly {
  void get volar => print('Yo estoy aquí arriba y tu ahí abajo');
}

class dolphin extends fish with swim{}

class dove extends bird with fly, walk{}

class duck extends mammal with walk, fly,swim{}

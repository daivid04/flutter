class BasicUserData {
  final String userName;
  final String correo;

  BasicUserData({
    required this.userName, 
    required this.correo});

  
}

  String userSearch(List<BasicUserData> users,String name) {
    if (users.isEmpty) {
      return '';
    }
    if (name.contains('@')) {
      int cant = users.length;
      for (int i = 0; i < cant; i++) {
        final nombreUsuario = users[i].correo.toLowerCase();
        if (nombreUsuario == name.toLowerCase()) {
          return nombreUsuario;
        }
      }
      return '';
    }
    return name.toLowerCase();
  }

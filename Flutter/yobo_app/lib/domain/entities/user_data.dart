import 'dart:io';

class UserData {
  final String names;
  final String surnames;
  final String userName;
  final String correo;
  final String password;
  final int edad;
  final File profilePicture;

  UserData(
      {required this.names,
      required this.surnames,
      required this.userName,
      required this.correo,
      required this.password,
      required this.edad,
      required this.profilePicture});
}
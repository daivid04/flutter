import 'dart:convert';
import 'dart:io';

import 'package:yobo_app/domain/entities/entities.dart';

UserDataModel userDataModelFromJson(String str) =>
    UserDataModel.fromJson(jsonDecode(str));

class UserDataModel {
  final String names;
  final String surnames;
  final String userName;
  final String correo;
  final String password;
  final int edad;
  final File profilePicture;

  UserDataModel(
      {required this.names,
      required this.surnames,
      required this.userName,
      required this.correo,
      required this.password,
      required this.edad,
      required this.profilePicture});

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
      names: json['names'],
      surnames: json['surnames'],
      userName: json['userName'],
      correo: json['correo'],
      password: json['password'],
      edad: json['edad'],
      profilePicture: json['profilePicture']);

  UserData toUserData() => UserData(
    names: names,
    surnames: surnames,
    userName: userName,
    correo: correo,
    password: password,
    edad: edad,
    profilePicture: profilePicture);
}

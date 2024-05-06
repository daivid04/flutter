import 'dart:convert';

import 'package:yobo_app/domain/entities/basic_user_data.dart';

BasicUserDataModel basicUserDataModelFromJson(String str) =>
    BasicUserDataModel.fromJson(jsonDecode(str));

class BasicUserDataModel {
  final List<BasicUserData>? users;

  BasicUserDataModel({required this.users});

  factory BasicUserDataModel.fromJson(Map<String, dynamic> json) =>
      BasicUserDataModel(
          users: List<BasicUserData>.from(json['BasicUserData']
              .map((x) => BasicUser.fromJson(x).toBasicUserData())));

}

class BasicUser {
  final String correo;
  final String userName;

  BasicUser({required this.correo, required this.userName});

  factory BasicUser.fromJson(Map<String, dynamic> json) =>
      BasicUser(correo: json['correo'], userName: json['userName']);

  BasicUserData toBasicUserData() =>
      BasicUserData(userName: userName, correo: correo);
}

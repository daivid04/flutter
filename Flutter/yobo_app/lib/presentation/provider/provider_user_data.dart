import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yobo_app/domain/entities/entities.dart';
import 'package:yobo_app/infrastructure/models/basic_user_data_models.dart';
import 'package:yobo_app/infrastructure/models/user_data_model.dart';

class ProviderUserData extends ChangeNotifier {
  SharedPreferences? _userData;
  String? _correo;
  String? _userName;
  UserData? userData;
  late BasicUserDataModel? basicUserData;
  bool _sectionStarted = false;

  Future<void> leadUserData() async {
    _userData = await SharedPreferences.getInstance();
    _sectionStarted = _userData!.getBool('sectionStarted') ?? false;
    if (_sectionStarted) {
      _correo = _userData!.getString('_correo');
      _userName = _userData!.getString('_userName');

      String userDataFromJson =
          await rootBundle.loadString('${_userName!}.json');
      userData = userDataModelFromJson(userDataFromJson).toUserData();
      _sectionStarted = true;
      // userData = userDataModelFromJson(dataFile).toUserData();
    }
    notifyListeners();
  }

  void carryBasicUserData() async {
    String json = await rootBundle.loadString('assets/data/users_data.json');
    basicUserData = basicUserDataModelFromJson(json);
  }

  String verify(String user) {
    carryBasicUserData();
    String userName = '';
    if (user.contains('@')) {
      int i = 0;
      bool cent = false;

      while (basicUserData!.users!.length < i && !cent) {
        if (basicUserData!.users![i].correo == user) {
          cent = true;
          userName = basicUserData!.users![i].userName;
        } else {
          i++;
        }
      }
    }
    // return userName;
    return 'ga';
    // return '';
  }

  Future<void> login(String user, String password) async {
    if (user.contains('@')) {
      String jsonUser = await rootBundle.loadString('key');
    }
  }
}

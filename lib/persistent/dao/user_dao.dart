import 'dart:convert';

import 'package:persistent/data/vo/user_vo.dart';
import 'package:persistent/persistent/dao/pref_instance.dart';
import 'package:persistent/persistent/preference_key_constant.dart';

class UserDAO {
  UserDAO._();

  static final UserDAO _singleton = UserDAO._();

  factory UserDAO() => _singleton;

  void save(UserVO userVO) {
    PrefInstance.getSharedPreferences.setString(kUserKey, jsonEncode(userVO));
  }

  UserVO? get getUser {
    final userData = PrefInstance.getSharedPreferences.getString(kUserKey);
    if (userData != null) {
      return UserVO.fromJson(jsonDecode(userData.toString()));
    }
    return null;
  }
}

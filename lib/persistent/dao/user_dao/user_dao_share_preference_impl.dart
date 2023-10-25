import 'dart:convert';

import 'package:persistent/data/vo/user_vo.dart';
import 'package:persistent/persistent/dao/pref_instance.dart';
import 'package:persistent/persistent/dao/user_dao/user_dao.dart';
import 'package:persistent/persistent/preference_key_constant.dart';

class UserDAOSharePreferenceImpl extends UserDAO {
  UserDAOSharePreferenceImpl._();

  static final UserDAOSharePreferenceImpl _singleton =
      UserDAOSharePreferenceImpl._();

  factory UserDAOSharePreferenceImpl() => _singleton;

  @override
  void save(UserVO userVO, {bool isAddedUserStream = false}) {
    PrefInstance.getSharedPreferences.setString(kUserKey, jsonEncode(userVO));
  }

  @override
  UserVO? getUser([int? id]) {
    final userData = PrefInstance.getSharedPreferences.getString(kUserKey);
    if (userData != null) {
      return UserVO.fromJson(jsonDecode(userData.toString()));
    }
    return null;
  }
}

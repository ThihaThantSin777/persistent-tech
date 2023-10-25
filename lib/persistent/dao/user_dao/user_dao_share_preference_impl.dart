import 'dart:async';
import 'dart:convert';

import 'package:persistent/data/vo/user_vo.dart';
import 'package:persistent/persistent/dao/pref_instance.dart';
import 'package:persistent/persistent/dao/user_dao/user_dao.dart';
import 'package:persistent/persistent/preference_key_constant.dart';

class UserDAOSharePreferenceImpl extends UserDAO {
  UserDAOSharePreferenceImpl._() {
    _userStream.sink.add(getUser);
  }

  static final UserDAOSharePreferenceImpl _singleton =
      UserDAOSharePreferenceImpl._();

  factory UserDAOSharePreferenceImpl() => _singleton;

  final StreamController<UserVO?> _userStream = StreamController<UserVO?>();

  Stream<UserVO?> get getUserStream => _userStream.stream;

  @override
  void save(UserVO userVO) {
    PrefInstance.getSharedPreferences.setString(kUserKey, jsonEncode(userVO));
    _userStream.sink.add(userVO);
  }

  @override
  UserVO? get getUser {
    final userData = PrefInstance.getSharedPreferences.getString(kUserKey);
    if (userData != null) {
      return UserVO.fromJson(jsonDecode(userData.toString()));
    }
    return null;
  }

  void closeStream() => _userStream.close();
}

import 'dart:async';

import 'package:persistent/data/vo/user_vo.dart';
import 'package:persistent/persistent/dao/user_dao/user_dao.dart';
import 'package:persistent/persistent/dao/user_dao/user_dao_hive_impl.dart';

class UserModel {
  UserModel._();

  static final UserModel _singleton = UserModel._();

  factory UserModel() => _singleton;

  // final UserDAO _userDAO = UserDAOSharePreferenceImpl();

  final UserDAO _userDAO = UserDAOHiveImpl();

  void save(UserVO userVO) => _userDAO.save(userVO);

  UserVO? get getUser => _userDAO.getUser();
}

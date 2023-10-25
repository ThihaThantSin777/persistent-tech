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

  final StreamController<UserVO?> _userStream = StreamController<UserVO?>();

  Stream<UserVO?> get getUserStream => _userStream.stream;

  Future<void> saveUserWithAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    final userData = UserVO(1, "Mg Mg", 21);
    save(userData);
    _userStream.sink.add(userData);
  }

  void save(UserVO userVO) => _userDAO.save(userVO);

  UserVO? get getUser => _userDAO.getUser(1);
}

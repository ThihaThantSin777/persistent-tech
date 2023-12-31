import 'dart:async';

import 'package:persistent/data/vo/user_vo.dart';
import 'package:persistent/persistent/dao/user_dao/user_dao.dart';
import 'package:persistent/persistent/dao/user_dao/user_dao_hive_impl.dart';
import 'package:stream_transform/stream_transform.dart';

class UserModel {
  UserModel._();

  static final UserModel _singleton = UserModel._();

  factory UserModel() => _singleton;

  // final UserDAO _userDAO = UserDAOSharePreferenceImpl();

  final UserDAO _userDAO = UserDAOHiveImpl();

  Stream<UserVO?> get getUserStream => UserDAOHiveImpl()
      .watchUserBox()
      .startWith(UserDAOHiveImpl().getUserDataStream)
      .map((event) => _userDAO.getUser(1));


  void closeStream() {
    _userStream.close();
  }


  Future<void> saveUserWithAsync({bool isUsedSharePreferences = false}) async {

    await Future.delayed(const Duration(seconds: 3));
    final userData = UserVO(1, "Mg Mg", 21);
    save(userData, isAddedUserStream: isUsedSharePreferences);
  }

  void save(UserVO userVO, {bool isAddedUserStream = false}) =>
      _userDAO.save(userVO, isAddedUserStream: isAddedUserStream);

  UserVO? get getUser => _userDAO.getUser(1);
}

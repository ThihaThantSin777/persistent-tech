import 'dart:async';

import 'package:hive/hive.dart';
import 'package:persistent/data/vo/user_vo.dart';
import 'package:persistent/persistent/dao/user_dao/user_dao.dart';
import 'package:persistent/persistent/hive_constant.dart';

class UserDAOHiveImpl extends UserDAO {
  UserDAOHiveImpl._();

  static final UserDAOHiveImpl _singleton = UserDAOHiveImpl._();

  factory UserDAOHiveImpl() => _singleton;

  @override
  // TODO: implement getUser
  UserVO? getUser([int? id]) => _getUserBox().get(id ?? 0);

  @override
  void save(UserVO userVO) {
    _getUserBox().put(userVO.id, userVO);
  }

  Stream<UserVO?> get getUserDataStream => Stream.value(getUser(1));

  Stream<void> watchUserBox() => _getUserBox().watch();

  Box<UserVO> _getUserBox() => Hive.box<UserVO>(kHiveUserVOBox);
}

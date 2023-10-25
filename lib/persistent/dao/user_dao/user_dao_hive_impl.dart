import 'dart:async';

import 'package:hive/hive.dart';
import 'package:persistent/data/vo/user_vo.dart';
import 'package:persistent/persistent/dao/user_dao/user_dao.dart';
import 'package:persistent/persistent/hive_constant.dart';

class UserDAOHiveImpl extends UserDAO {
  final StreamController<UserVO?> _userStream = StreamController<UserVO?>();

  UserDAOHiveImpl._();

  static final UserDAOHiveImpl _singleton = UserDAOHiveImpl._();

  factory UserDAOHiveImpl() => _singleton;

  @override
  // TODO: implement getUser
  UserVO? getUser([int? id]) => _getUserBox().get(id ?? 0);

  @override
  void save(UserVO userVO, {bool isAddedUserStream = false}) {
    _getUserBox().put(userVO.id, userVO);
    if (isAddedUserStream) {
      _userStream.sink.add(userVO);
    }
  }

  Stream<UserVO?> get getUserStream => _userStream.stream;

  Box<UserVO> _getUserBox() => Hive.box<UserVO>(kHiveUserVOBox);
}

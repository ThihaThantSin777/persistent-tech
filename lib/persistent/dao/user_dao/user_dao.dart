import '../../../data/vo/user_vo.dart';

abstract class UserDAO {
  void save(UserVO userVO, {bool isAddedUserStream = false});

  UserVO? getUser([int? id]);
}

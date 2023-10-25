import '../../../data/vo/user_vo.dart';

abstract class UserDAO {
  void save(UserVO userVO);

  UserVO? get getUser;
}

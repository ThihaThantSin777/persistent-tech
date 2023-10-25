import 'package:persistent/persistent/dao/count_dao/count_dao.dart';
import 'package:persistent/persistent/dao/count_dao/count_dao_hive_impl.dart';
import 'package:persistent/persistent/dao/count_dao/count_dao_share_preferences_impl.dart';

class CountModel {
  CountModel._();

  static final CountModel _singleton = CountModel._();

  factory CountModel() => _singleton;

  //final CountDAO _countDAO = CountDAOSharePreferencesImpl();
  final CountDAO _countDAO = CountDAOHiveImpl();

  void saveCountValue(int countValue) {
    _countDAO.saveCountValue(countValue);
  }

  int get getCountValue {
    return _countDAO.getCountValue ?? 0;
  }
}

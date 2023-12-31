import 'package:persistent/persistent/dao/count_dao/count_dao.dart';
import 'package:hive/hive.dart';
import 'package:persistent/persistent/hive_constant.dart';

class CountDAOHiveImpl extends CountDAO {
  CountDAOHiveImpl._();

  static final CountDAOHiveImpl _singleton = CountDAOHiveImpl._();

  factory CountDAOHiveImpl() => _singleton;

  @override
  int? get getCountValue => _getCountBox().get(kHiveCountKey);

  @override
  void saveCountValue(int countValue) {
    _getCountBox().put(kHiveCountKey, countValue);
  }

  Box<int> _getCountBox() => Hive.box<int>(kHiveCountBox);
}

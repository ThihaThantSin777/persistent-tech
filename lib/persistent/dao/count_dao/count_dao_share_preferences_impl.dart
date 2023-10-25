import 'package:persistent/persistent/dao/count_dao/count_dao.dart';
import 'package:persistent/persistent/dao/pref_instance.dart';
import 'package:persistent/persistent/preference_key_constant.dart';

class CountDAOSharePreferencesImpl extends CountDAO {
  CountDAOSharePreferencesImpl._();

  static final CountDAOSharePreferencesImpl _singleton =
      CountDAOSharePreferencesImpl._();

  factory CountDAOSharePreferencesImpl() => _singleton;

  @override
  void saveCountValue(int countValue) {
    PrefInstance.getSharedPreferences.setInt(kCountKey, countValue);
  }

  @override
  int? get getCountValue => PrefInstance.getSharedPreferences.getInt(kCountKey);
}

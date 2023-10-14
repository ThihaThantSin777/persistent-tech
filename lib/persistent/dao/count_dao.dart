import 'package:persistent/persistent/dao/pref_instance.dart';
import 'package:persistent/persistent/preference_key_constant.dart';

class CountDAO {
  CountDAO._();

  static final CountDAO _singleton = CountDAO._();

  factory CountDAO() => _singleton;

  void saveCountValue(int countValue) {
    PrefInstance.getSharedPreferences.setInt(kCountKey, countValue);
  }

  int? get getCountValue => PrefInstance.getSharedPreferences.getInt(kCountKey);
}

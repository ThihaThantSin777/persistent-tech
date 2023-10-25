import 'package:hive/hive.dart';
import 'package:persistent/persistent/hive_constant.dart';

part 'user_vo.g.dart';

@HiveType(
  typeId: kHiveTypeIDForUserVo,
)
class UserVO {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  int age;

  UserVO(this.id, this.name, this.age);

  factory UserVO.fromJson(Map<String, dynamic> json) =>
      UserVO(json['id'] as int, json['name'] as String, json['age'] as int);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'age': age,
      };

  @override
  String toString() {
    return 'id: $id, name: $name, age: $age';
  }
}

class UserVO {
  int id;
  String name;
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

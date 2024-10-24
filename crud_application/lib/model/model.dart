import 'package:hive_flutter/hive_flutter.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class Student {
  @HiveField(0)
  String? imagepath;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? age;

  @HiveField(3)
  String? cls;

  Student({
    required this.imagepath,
    required this.name,
    required this.age,
    required this.cls,
  });
}

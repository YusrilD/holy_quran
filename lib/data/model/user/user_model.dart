import 'package:isar/isar.dart';

part 'user_model.g.dart';

@collection
class UserModel {
  Id? id = Isar.autoIncrement;
  String? name;

  UserModel({
    this.id,
    this.name,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

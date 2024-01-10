import 'package:flutter/services.dart' show rootBundle;

class UserModel {
  int? id;
  String? name;
  String? sex;
  String? email;
  String? phone;
  String? avt;

  UserModel({
    this.id,
    this.name,
    this.sex,
    this.email,
    this.phone,
    this.avt,
  });

  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, sex: $sex, email: $email, phone: $phone, avt: $avt}';
  }

  // The fromJson constructor
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      sex: json['sex'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      avt: json['avt'] as String?,
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sex'] = this.sex;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['avt'] = this.avt;
    return data;
  }
}


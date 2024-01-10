import 'UserModel.dart';

class  UserModelList{
  List<UserModel>? result;

  UserModelList({this.result});

  UserModelList.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <UserModel>[];
      json['result'].forEach((v) {
        result!.add(new UserModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

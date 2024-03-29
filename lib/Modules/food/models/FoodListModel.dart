class FoodListModel {
  bool? success;
  Null? message;
  Null? customData;
  Null? item;
  List<Data>? data;
  int? dataCount;

  FoodListModel(
      {this.success,
        this.message,
        this.customData,
        this.item,
        this.data,
        this.dataCount});

  FoodListModel.fromJson(Map<String, dynamic> json) {
    success = json['Success'];
    message = json['Message'];
    customData = json['CustomData'];
    item = json['Item'];
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    dataCount = json['DataCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Success'] = this.success;
    data['Message'] = this.message;
    data['CustomData'] = this.customData;
    data['Item'] = this.item;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['DataCount'] = this.dataCount;
    return data;
  }
}

class Data {
  int? foodListId;
  String? category;
  int? categoryId;
  String? foodName;
  int? price;
  int? qty;
  String? uploadImage;
  String? description;
  int? userId;
  bool? status;

  Data(
      {this.foodListId,
        this.category,
        this.categoryId,
        this.foodName,
        this.price,
        this.qty,
        this.uploadImage,
        this.description,
        this.userId,
        this.status});

  Data.fromJson(Map<String, dynamic> json) {
    foodListId = json['FoodListId'];
    category = json['Category'];
    categoryId = json['CategoryId'];
    foodName = json['FoodName'];
    price = json['Price'];
    qty = json['qty'];
    uploadImage = json['UploadImage'];
    description = json['Description'];
    userId = json['UserId'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FoodListId'] = this.foodListId;
    data['Category'] = this.category;
    data['CategoryId'] = this.categoryId;
    data['FoodName'] = this.foodName;
    data['Price'] = this.price;
    data['qty'] = this.qty;
    data['UploadImage'] = this.uploadImage;
    data['Description'] = this.description;
    data['UserId'] = this.userId;
    data['Status'] = this.status;
    return data;
  }
}

import 'dart:convert';

import 'package:flutter/services.dart';

class Product {
  List<Result>? result;
  String assetskey = "assets/user/user_data.json";
  Product({this.result});

  Product.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
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

  static Future<Product?> initializeData() async {
    try {
      final json = await rootBundle.loadString("assets/user/product_data.json");
      final decodedData = jsonDecode(json);
      if (decodedData != null && decodedData['result'] != null) {
        // Creating a Product instance from the JSON response
        Product result = Product.fromJson(decodedData);
        // Accessing the list of Result instances
        print(result);
        return result;
      }
    } catch (error) {
      // Handle any potential errors
      print("Error initializing data: $error");
    }
    return null; // Trả về null trong trường hợp lỗi
  }
}

class Result {
  int? id;
  String? name;
  double? price;
  String? image;
  int? Quantity;

  Result({this.id, this.name, this.price, this.image});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
  void ToString(){
    print("Name:"+ this.name! +" số lượng: "+this.Quantity!.toString());
  }
}

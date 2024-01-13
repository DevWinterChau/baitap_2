import 'package:dart/Models/ProductModel.dart';
import 'package:flutter/cupertino.dart';

import 'CartItme.dart';

class Cart with ChangeNotifier {
  List<Result> _items = [];

  List<Result> get items => _items;

  void addItem(Result item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}

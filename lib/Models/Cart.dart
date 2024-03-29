import 'package:dart/Models/ProductModel.dart';
import 'package:flutter/cupertino.dart';

import 'CartItme.dart';

class Cart with ChangeNotifier {
  List<Result> _items = [];
  List<Result> get items => _items;

  void addItem(Result item) {
    if (_items.isEmpty) {
      item.Quantity = 1;
      _items.add(item);
    } else {
      bool itemExists = false;

      for (var i in _items) {
        if (i.id == item.id) {
          i.Quantity = i.Quantity! + 1;
          itemExists = true;
          break;
        }
      }
      if (!itemExists) {
        item.Quantity = 1;
        _items.add(item);
      }
    }
    _items.sort((a,b) => b.name!.compareTo(a.name!));
    notifyListeners();
  }

  void removeItem(int index) {
    if(items[index].Quantity == 1){
      _items.removeAt(index);
    }
    else{
      items[index].Quantity = items[index].Quantity! - 1;
    }
    _items.sort((a,b) => b.name!.compareTo(a.name!));
    notifyListeners();
  }
}

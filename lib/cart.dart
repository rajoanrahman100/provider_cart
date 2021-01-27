import 'package:flutter/foundation.dart';
import 'package:provider_cart/item.dart';
import 'package:provider/provider.dart';

class Cart extends ChangeNotifier {
  List<Item> _items = [];

  double _totalPrice = 0.0;
  int _productItems;
  int index;

  void add(Item item) {
    _items.add(item);
    _totalPrice += item.price;
    notifyListeners();
  }

  void remove(Item item) {
    _totalPrice -= item.price;
    _items.remove(item);
    notifyListeners();
  }


  void addProductCount(Item item){
    //_items.add(item);
    item.count+=1;
    //item.price=item.price*item.count;
    notifyListeners();
  }

  void removeProductCount(Item item){
    //_items.add(item);
    item.count-=1;
    notifyListeners();
  }

  void addItemsTotalPrice(Item item){
    item.totalPrice=item.totalPrice+item.price;
    notifyListeners();
  }

  void removeItemTotalPrice(Item item){

    item.totalPrice=item.totalPrice-item.price;
    _totalPrice -= item.price;
    _items.remove(item);
    notifyListeners();
  }


  int get count {
    return _items.length;
  }

  double get totalPrice {
    return _totalPrice;
  }

  List<Item> get basketItems {
    return _items;
  }

  int get productItems{
    return _productItems;
  }
}
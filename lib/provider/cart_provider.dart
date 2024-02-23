import '../models/cat.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  
  final List<Cat> _items = [];

  List<Cat> get items => _items;

  void add(Cat item) {
    _items.add(item);
    notifyListeners();
  }

  void remove(Cat item) {
    _items.remove(item);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }

  double getTotal() {
    return _items.fold(0, ((previousValue, item) => previousValue + item.price));
  }
}
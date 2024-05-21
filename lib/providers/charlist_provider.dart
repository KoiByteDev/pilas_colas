import 'package:flutter/material.dart';

class CharListProvider with ChangeNotifier {
  List<String> _charList = [];

  List<String> get charList => _charList;

  void addItem(String item) {
    _charList.add(item);
    notifyListeners();
  }

  void removeItem() {
    _charList.removeLast();
    notifyListeners();
  }
}

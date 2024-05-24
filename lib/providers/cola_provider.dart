import 'package:flutter/material.dart';

class ColaProvider with ChangeNotifier {
  List<String> _charList = List.filled(6, '');
  int _front = 0;
  int _rear = 0;

  List<String> get charList => _charList;
  int get front => _front;
  int get rear => _rear;

  String getFront() {
    return _charList[_front];
  }

  String getRear() {
    return _charList[_rear];
  }

  void addItem(String item) {
    print(_charList);
    _charList[_front] = item;
    _front = ((_front + 1) % _charList.length).toInt();
    notifyListeners();
  }

  void removeItem() {
    _charList[_rear] = '';
    _rear = ((_rear + 1) % _charList.length).toInt();
    if (_charList[_rear] == '' && _charList[_front] == '') {
      _rear = 0;
      _front = 0;
    }
    notifyListeners();
  }
}

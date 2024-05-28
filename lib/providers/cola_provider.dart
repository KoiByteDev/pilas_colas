import 'package:flutter/material.dart';

class ColaProvider with ChangeNotifier {
  List<String> _charList = List.filled(6, '');
  int _front = 0;
  int _rear = 0;
  int _counter = 0;

  List<String> get charList => _charList;
  int get front => _front;
  int get rear => _rear;
  int get counter => _counter;

  String getRear() {
    return _charList[_rear];
  }

  void addItem(String item) {
    if (_charList[_rear] == '' && _charList[_front] == '') {
      _charList[_front] = item;
    } else {
      _charList[((_front + 1) % _charList.length).toInt()] = item;
      _front = ((_front + 1) % _charList.length).toInt();
    }
    if (charList[_front] == '') {
      _counter = 0;
    } else {
      _counter = _counter + 1;
    }
    print(counter);
    print('Frente =  ${_front}');
    print('Final =  ${_rear}');
    notifyListeners();
  }

  void removeItem() {
    _charList[_rear] = '';
    _rear = ((_rear + 1) % _charList.length).toInt();
    if (_charList[_rear] == '' && _charList[_front] == '') {
      _rear = 0;
      _front = 0;
      _counter = 0;
    } 
    print(_counter);
    print('Frente =  ${_front}');
    print('Final =  ${_rear}');
    notifyListeners();
  }
}

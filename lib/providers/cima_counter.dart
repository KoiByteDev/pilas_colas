import 'package:flutter/material.dart';

class CimaCounter with ChangeNotifier {
  int _cima = 0;

  int get cima => _cima;

  void add() {
    _cima += 1;
    notifyListeners();
  }

  void substract() {
    _cima -= 1;
    notifyListeners();
  }
}

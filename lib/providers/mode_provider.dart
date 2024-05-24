import 'package:flutter/material.dart';

class ModeProvider with ChangeNotifier {
  var _mode = '';

  String get mode => _mode;

  void setPila() {
    _mode = 'pila';
    notifyListeners();
  }

  void setCola() {
    _mode = 'cola';
    notifyListeners();
  }
}
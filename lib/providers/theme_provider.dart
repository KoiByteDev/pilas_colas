import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  var _lightTheme = true;

  bool get lightTheme => _lightTheme;

  void toggleTheme() {
    _lightTheme = !_lightTheme;
    notifyListeners();
  }
}
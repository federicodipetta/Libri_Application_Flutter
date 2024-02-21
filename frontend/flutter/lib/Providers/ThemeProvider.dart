import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeData = ThemeMode.system;

  ThemeMode get theme => _themeData;

  ThemeMode getTheme() => _themeData;

  void ChangeTheme() {
    if (_themeData == ThemeMode.light) {
      _themeData = ThemeMode.dark;
    } else {
      _themeData = ThemeMode.light;
    }
    notifyListeners();
  }
}

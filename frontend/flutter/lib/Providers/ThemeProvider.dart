import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeData = ThemeMode.dark;

  ThemeMode get theme => _themeData;
  static SharedPreferences? _prefs;
  static Future init() async => _prefs = await SharedPreferences.getInstance();

  ThemeProvider() {
    _themeData =
        _prefs?.getBool('darkMode') ?? true ? ThemeMode.dark : ThemeMode.light;
  }
  void ChangeTheme() async {
    if (_themeData == ThemeMode.light) {
      _themeData = ThemeMode.dark;
      await _prefs?.setBool('darkMode', true);
    } else {
      _themeData = ThemeMode.light;
      await _prefs?.setBool('darkMode', false);
    }
    notifyListeners();
  }
}

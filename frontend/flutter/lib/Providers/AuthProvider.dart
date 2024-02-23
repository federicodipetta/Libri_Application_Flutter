import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  static SharedPreferences? _prefs;
  static Future init() async => _prefs = await SharedPreferences.getInstance();

  bool _isLogged = false;
  String _token = '';
  String get token => _token;

  bool get isLogged => _isLogged;

  AuthProvider() {
    _token = _prefs?.getString('token') ?? '';
    _isLogged = _token.isNotEmpty;
  }

  Future<void> login(String token) async {
    _isLogged = true;
    _token = token;
    var pf = await SharedPreferences.getInstance();
    if (await pf.setString('token', token)) {
      notifyListeners();
    }
  }

  void logout() async {
    _isLogged = false;
    _token = '';
    var pf = await SharedPreferences.getInstance();
    if (await pf.remove('token')) {
      notifyListeners();
    }
  }
}

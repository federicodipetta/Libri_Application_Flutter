import 'package:code/Service/AuthService.dart';
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

  Future<bool> register(String login, String password, String mail) async {
    var x = await AuthService.register(login, password, mail);
    if (x.isEmpty) return false;
    // il login è andato a buon fine
    return _setToken(x);
  }

  Future<bool> login(String login, String password) async {
    var x = await AuthService.login(login, password);
    if (x.isEmpty) return false;
    // il login è andato a buon fine
    return _setToken(x);
  }

  void logout() async {
    _isLogged = false;
    _token = '';
    var pf = await SharedPreferences.getInstance();
    if (await pf.remove('token')) {
      notifyListeners();
    }
  }

  Future<bool> _setToken(String token) async {
    _isLogged = true;
    _token = token;
    var pf = await SharedPreferences.getInstance();
    if (await pf.setString('token', _token)) {
      notifyListeners();
    }
    return true;
  }
}

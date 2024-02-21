import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLogged = false;
  String _token = '';
  String get token => _token;
  bool get isLogged => _isLogged;

  void login(String? token) {
    _isLogged = true;
    if (token != null) _token = token;
    notifyListeners();
  }

  void logout() {
    _isLogged = false;
    _token = '';
    notifyListeners();
  }
}

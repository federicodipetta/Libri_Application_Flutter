import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService {
  static String url = '10.0.2.2:5073';
  static String controller = '/api/v1/Autenticazione';

  static Future<String> login(String login, String password) async {
    var response = await http.post(Uri.http(url, '$controller/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'login': login, 'password': password}));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }

  static Future<String> register(
      String login, String password, String email) async {
    var response = await http.post(Uri.http(url,'$controller/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
            {'username': login, 'password': password, 'email': email}));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return '';
    }
  }
}

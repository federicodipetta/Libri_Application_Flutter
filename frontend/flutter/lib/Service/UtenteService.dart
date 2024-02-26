import 'dart:convert';

import 'package:code/Models/Utente.dart';
import 'package:http/http.dart' as http;

class UtenteService {
  static const String url = '10.0.2.2:5073';
  static const String controller = '/api/v1/Utente';

  static Future<Utente> getUtente(String token) async {
    var response = await http.get(Uri.http(url, controller),
        headers: {'authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      return Utente.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load utente');
    }
  }
}

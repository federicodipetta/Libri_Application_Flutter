import 'dart:convert';

import 'package:code/Models/LibroMinimo.dart';
import 'package:code/Models/Recensione.dart';
import 'package:code/Models/RecensioneMinima.dart';
import 'package:http/http.dart' as http;

class RecensioneService {
  static String url = "10.0.2.2:5073";
  static String controller = "api/v1/Recensione";

  static Future<Recensione> getRecensione(String id) async {
    var response =
        await http.get(Uri.http(url, "$controller/GetRecensione/1/" + id));
    if (response.statusCode == 200) {
      Recensione recensione = Recensione.defaultRecensione();
      try {
        var decodedResponse = jsonDecode(response.body);
        recensione = Recensione.fromJson(decodedResponse['result']);
      } catch (e) {
        print(e);
      }
      return recensione;
    } else {
      throw Exception('Failed to load recensione');
    }
  }

  static Future<List<RecensioneMinima>> getRecensioni() async {
    var response = await http.get(Uri.http(url, "$controller/GetRecensioni/1"));
    if (response.statusCode == 200) {
      List<RecensioneMinima> recensioni = [];
      try {
        jsonDecode(Utf8Decoder().convert(response.bodyBytes))
            .forEach((element) {
          recensioni.add(RecensioneMinima.fromJson(element));
        });
      } catch (e) {
        print(e);
      }
      return recensioni;
    } else {
      throw Exception('Failed to load recensioni');
    }
  }

  static Future<bool> addRecensione(String isbn, String recensione, int voto,
      int stato, String periodo) async {
    var response = await http.post(Uri.http(url, "$controller/AddRecensione"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "idUtente": 1,
          "isbn": isbn,
          "testo": recensione,
          "voto": voto,
          "stato": stato,
          "periodo": periodo
        }));
    return response.statusCode == 200;
  }

  static Future<bool> modificaRecensione(String idlibro, String recensione,
      int votazione, int statoToInt, String periodo) async {
    var response =
        await http.put(Uri.http(url, "$controller/ModificaRecensione"),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({
              "idUtente": 1,
              "idLibro": idlibro,
              "Recensione": recensione,
              "voto": votazione,
              "stato": statoToInt,
              "periodo": periodo
            }));
    return response.statusCode == 200;
  }

  static Future<bool> deleteRecensione(String id) async {
    var x = await http.delete(Uri.http(url, "$controller/DeleteRecensione"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"idUtente": 1, "idLibro": id}));
    return x.statusCode == 200;
  }
}

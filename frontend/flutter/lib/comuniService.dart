import 'dart:convert';

import 'package:http/http.dart' as http;

class ComuniService {
  static String url = "10.0.20.21:3000";
  static Future<List<Comune>> getComuni() async {
    var response = await http.get(Uri.http(url, "/comuni"));
    if (response.statusCode == 200) {
      List<Comune> comuni = [];
      print("a");
      try {
        jsonDecode(Utf8Decoder().convert(response.bodyBytes))
            .forEach((element) {
          comuni.add(Comune.fromJson(element));
        });
      } catch (e) {
        print(e);
      }
      print("b");
      return comuni;
    } else {
      throw Exception('Failed to load comuni');
    }
  }

  static Future<List<Comune>> getComuniAggiunti() async {
    var response = await http.get(Uri.http(url, "/comuniAgg"));
    if (response.statusCode == 200) {
      List<Comune> comuni = [];
      try {
        jsonDecode(Utf8Decoder().convert(response.bodyBytes))
            .forEach((element) {
          comuni.add(Comune.fromJson(element));
        });
      } catch (e) {
        print(e);
      }
      return comuni;
    } else {
      throw Exception('Failed to load comuni');
    }
  }

  static void addComune(String nome) async {
    Comune? comune;
    List<Comune> c = await getComuni();
    comune = c.firstWhere(
        (element) => element.nome.toLowerCase() == nome.toLowerCase());
    await http.post(Uri.http(url, "/comunia"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(comune.toJson()));
  }
}

class Comune {
  String id;
  String nome;
  String provincia;

  Comune({required this.id, required this.nome, required this.provincia});

  factory Comune.fromJson(Map<String, dynamic> json) {
    return Comune(
        id: json['id'], nome: json['nome'], provincia: json['provincia']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'nome': nome, 'provincia': provincia};
  }
}

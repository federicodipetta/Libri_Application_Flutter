import "package:http/http.dart" as http;
import "dart:convert";
import 'package:code/Models/Libro.dart';

class LibriService {
  static String url = "10.0.2.2:3000";

  static Future<Libro> getLibro(String isbn) async {
    var response = await http.get(Uri.http(url, "/api/v0/libro" + isbn));
    if (response.statusCode == 200) {
      Libro libro = Libro.defaultLibro();
      try {
        var decodedResponse = jsonDecode(response.body);
        libro = Libro.fromJson(decodedResponse);
      } catch (e) {
        print(e);
      }
      return libro;
    } else {
      throw Exception('Failed to load libri');
    }
  }

  static void addLibro(String isbn) async {
    await http.post(Uri.http(url, "/api/v0/libro"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"isbn": isbn}));
  }

  static Future<List<Libro>> getLibri() async {
    var response = await http.get(Uri.http(url, "/api/v0/libri"));
    if (response.statusCode == 200) {
      List<Libro> libri = [];
      try {
        jsonDecode(Utf8Decoder().convert(response.bodyBytes))
            .forEach((element) {
          libri.add(Libro.fromJson(element));
        });
        libri.forEach((element) {
          print(element.toJson());
        });
      } catch (e) {
        print(e);
      }
      return libri;
    } else {
      throw Exception('Failed to load libri');
    }
  }
}

import "package:http/http.dart" as http;
import "dart:convert";

class LibriService {
  static String url = "192.168.1.3:3000";

  static Future<Libro> getLibro(String isbn) async {
    var response = await http.get(Uri.http(url, "/api/v0/libro"));
    if (response.statusCode == 200) {
      Libro libro = Libro(isbn: "", titolo: "", autore: "");
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
    await http.post(Uri.http(url, "/api/v0/libri"),
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

class Libro {
  String isbn;
  String titolo;
  String autore;

  Libro({required this.isbn, required this.titolo, required this.autore});

  factory Libro.fromJson(Map<String, dynamic> json) {
    return Libro(
      isbn: json['items'][0]['volumeInfo']['industryIdentifiers'][1]
          ['identifier'],
      titolo: json['items'][0]['volumeInfo']['title'],
      autore: json['items'][0]['volumeInfo']['authors'][0],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "isbn": isbn,
      "titolo": titolo,
      "autore": autore,
    };
  }
}

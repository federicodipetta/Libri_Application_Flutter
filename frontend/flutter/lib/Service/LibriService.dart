import "package:code/Models/LibroMinimo.dart";
import "package:http/http.dart" as http;
import "dart:convert";
import 'package:code/Models/Libro.dart';

class LibriService {
  static String url = "10.0.2.2:5073";
  static String controller = "api/v1/Libro";

  static Future<LibroMinimo> getLibroRidotto(String isbn) {
    return http
        .get(Uri.http(url, "$controller/GetLibroIsbn/$isbn"))
        .then((response) {
      if (response.statusCode == 200) {
        return LibroMinimo.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load libro');
      }
    });
  }
}

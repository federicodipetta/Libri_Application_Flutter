import 'package:code/Models/Libro.dart';

class Recensione {
  Libro libro;
  String recensione;
  int voto;
  String periodo;
  Recensione(
      {required this.libro,
      required this.recensione,
      required this.voto,
      required this.periodo});

  factory Recensione.fromJson(Map<String, dynamic> json) {
    return Recensione(
      libro: Libro.fromJson(json['libro']),
      recensione: json['recensione']['recensione'],
      voto: json['recensione']['voto'],
      periodo: json['recensione']['periodo'],
    );
  }

  static Recensione defaultRecensione() {
    return Recensione(
      libro: Libro.defaultLibro(),
      recensione: "",
      voto: 0,
      periodo: "",
    );
  }
}

import 'package:code/Models/Libro.dart';
import 'package:code/Models/Stato.dart';

class Recensione {
  Libro libro;
  String recensione;
  int voto;
  String periodo;
  Stato stato;
  Recensione(
      {required this.libro,
      required this.recensione,
      required this.voto,
      required this.periodo,
      required this.stato});

  factory Recensione.fromJson(Map<String, dynamic> json) {
    return Recensione(
      libro: Libro.fromJson(json['libro']),
      recensione: json['recensione']['recensione'],
      voto: json['recensione']['voto'],
      periodo: json['recensione']['periodo'],
      stato: Stato.statoFromInt(json['recensione']['stato']),
    );
  }

  static Recensione defaultRecensione() {
    return Recensione(
      libro: Libro.defaultLibro(),
      recensione: "",
      voto: 0,
      periodo: "",
      stato: Stato.statoFromInt(0),
    );
  }
}

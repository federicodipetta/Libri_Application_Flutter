import 'package:code/Models/LibroMinimo.dart';

class RecensioneMinima {
  final LibroMinimo libro;
  final int voto;

  RecensioneMinima({required this.libro, required this.voto});

  factory RecensioneMinima.fromJson(Map<String, dynamic> json) {
    return RecensioneMinima(
      libro: LibroMinimo.fromJson(json['libro']),
      voto: json['voto'],
    );
  }
}

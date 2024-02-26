import 'package:code/Models/LibroMinimo.dart';

class Libro {
  String isbn;
  String titolo;
  List<String> autori;
  String id;
  String img;
  String descrizione;
  String editore;
  String anno;
  List<String> categorie = [];

  Libro({
    required this.isbn,
    required this.titolo,
    required this.autori,
    required this.id,
    required this.img,
    required this.descrizione,
    required this.editore,
    required this.anno,
    required this.categorie,
  });

  factory Libro.fromJson(Map<String, dynamic> json) {
    return Libro(
      isbn: json['isbn'],
      titolo: json['titolo'],
      autori: (json['autori'] as List).map((x) => x.toString()).toList(),
      id: json['id'],
      img: json['urlImg'],
      descrizione: json['descrizione'],
      editore: json['editore'],
      anno: json['anno'],
      categorie:
          (json['categorie'] as List).map((x) => x.toString().trim()).toList(),
    );
  }
  factory Libro.defaultLibro() {
    return Libro(
      isbn: "",
      titolo: "",
      autori: [],
      id: "",
      img: "",
      descrizione: "",
      editore: "",
      anno: "",
      categorie: [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isbn': isbn,
      'titolo': titolo,
      'autori': autori,
      'id': id,
      'img': img,
      'descrizione': descrizione,
      'editore': editore,
      'anno': anno,
      'categorie': categorie,
    };
  }

  getIsbn() {
    return isbn;
  }

  getId() {
    return id;
  }

  LibroMinimo toLibroMinimo() {
    return LibroMinimo(
      img: img,
      titolo: titolo,
      autori: autori,
      id: id,
    );
  }
}

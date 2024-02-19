class Libro {
  String isbn;
  String titolo;
  List<String> autori;
  String id;
  String img;
  String descrizione;
  String editore;
  String anno;
  Libro(
      {required this.isbn,
      required this.titolo,
      required this.autori,
      required this.id,
      required this.img,
      required this.descrizione,
      required this.editore,
      required this.anno});

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
    };
  }

  getIsbn() {
    return isbn;
  }

  getId() {
    return id;
  }
}

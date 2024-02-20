class LibroMinimo {
  final String titolo;
  final String img;
  final List<String> autori;
  final String id;

  LibroMinimo(
      {required this.titolo,
      required this.img,
      required this.autori,
      required this.id});

  factory LibroMinimo.fromJson(Map<String, dynamic> json) {
    return LibroMinimo(
      titolo: json['titolo'],
      img: json['urlImg'],
      autori: (json['autori'] as List).map((x) => x.toString()).toList(),
      id: json['id'],
    );
  }

  factory LibroMinimo.defaultLibro() {
    return LibroMinimo(
      titolo: "",
      img: "",
      autori: [],
      id: "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'titolo': titolo,
      'img': img,
      'autori': autori,
      'id': id,
    };
  }
}

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

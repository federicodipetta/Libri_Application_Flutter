class Utente {
  final String nome;
  final String mail;
  const Utente({required this.nome, required this.mail});
  factory Utente.fromJson(Map<String, dynamic> json) {
    return Utente(nome: json['login'], mail: json['email']);
  }
}

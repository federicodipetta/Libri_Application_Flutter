import 'package:code/Models/Utente.dart';
import 'package:code/Providers/AuthProvider.dart';
import 'package:code/Service/UtenteService.dart';
import 'package:flutter/material.dart';

class UtenteProvider extends ChangeNotifier {
  Future<Utente> _utente =
      Future.value(Utente(nome: "anonimo", mail: "anonimo@anonimo.com"));
  Future<Utente> get utente => _utente;
  final AuthProvider authProvider;
  UtenteProvider({required this.authProvider});

  Future<void> fetchUtente() async {
    _utente = UtenteService.getUtente(authProvider.token);
    notifyListeners();
  }
}

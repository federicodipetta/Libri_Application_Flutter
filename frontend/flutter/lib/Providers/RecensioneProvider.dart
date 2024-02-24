import 'package:code/Models/Recensione.dart';
import 'package:code/Models/RecensioneMinima.dart';
import 'package:code/Models/Stato.dart';
import 'package:code/Providers/AuthProvider.dart';
import 'package:code/Service/AuthService.dart';
import 'package:code/Service/RecensioneService.dart';
import 'package:flutter/material.dart';

class RecensioneProvider extends ChangeNotifier {
  Future<List<RecensioneMinima>> _recensioni =
      Future(() => <RecensioneMinima>[]);
  Future<List<RecensioneMinima>> get recensioni => _recensioni;
  List<Recensione> _recensioniComplete = [];
  List<Recensione> get recensioniComplete => _recensioniComplete;
  final AuthProvider authProvider;

  RecensioneProvider({required this.authProvider});

  Future<Recensione> getRecensione(String id) {
    return RecensioneService.getRecensione(id, authProvider.token);
  }

  Future<List<RecensioneMinima>> getRecensioni() {
    _fetchRecensioni();
    return _recensioni;
  }

  void addRecensione(
      String isbn, String recensione, int voto, Stato stato, String periodo) {
    RecensioneService.addRecensione(isbn, recensione, voto,
            Stato.statoToInt(stato), periodo, authProvider.token)
        .then((value) => {if (value) _fetchRecensioni()});
  }

  void modificaRecensione(
      String id, String recensione, int voto, Stato stato, String periodo) {
    RecensioneService.modificaRecensione(id, recensione, voto,
            Stato.statoToInt(stato), periodo, authProvider.token)
        .then((value) => {if (value) _fetchRecensioni()});
  }

  void _fetchRecensioni() {
    _recensioni = RecensioneService.getRecensioni(authProvider.token);
    notifyListeners();
  }

  Future<bool> deleteRecensione(String id) async {
    var x = await RecensioneService.deleteRecensione(id, authProvider.token);
    if (x) {
      _fetchRecensioni();
    }
    return x;
  }
}

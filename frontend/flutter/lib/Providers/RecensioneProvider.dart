import 'package:code/Models/Recensione.dart';
import 'package:code/Models/RecensioneMinima.dart';
import 'package:code/Models/Stato.dart';
import 'package:code/Service/RecensioneService.dart';
import 'package:flutter/material.dart';

class RecensioneProvider extends ChangeNotifier {
  Future<List<RecensioneMinima>> _recensioni =
      RecensioneService.getRecensioni();
  Future<List<RecensioneMinima>> get recensioni => _recensioni;
  List<Recensione> _recensioniComplete = [];
  List<Recensione> get recensioniComplete => _recensioniComplete;

  Future<Recensione> getRecensione(String id) {
    return RecensioneService.getRecensione(id);
  }

  void addRecensione(
      String isbn, String recensione, int voto, Stato stato, String periodo) {
    RecensioneService.addRecensione(
            isbn, recensione, voto, Stato.statoToInt(stato), periodo)
        .then((value) => {if (value) _fetchRecensioni()});
  }

  void modificaRecensione(
      String id, String recensione, int voto, Stato stato, String periodo) {
    RecensioneService.modificaRecensione(
            id, recensione, voto, Stato.statoToInt(stato), periodo)
        .then((value) => {if (value) _fetchRecensioni()});
  }

  void _fetchRecensioni() {
    _recensioni = RecensioneService.getRecensioni();
    notifyListeners();
  }

  Future<bool> deleteRecensione(String id) async {
    var x = await RecensioneService.deleteRecensione(id);
    if (x) {
      _fetchRecensioni();
    }
    return x;
  }
}

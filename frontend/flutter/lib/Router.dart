import 'package:code/Models/LibroMinimo.dart';
import 'package:code/Models/Stato.dart';
import 'package:code/Widgets/AccountScreen.dart';
import 'package:code/Widgets/LibreriaHome.dart';
import 'package:code/Widgets/QRScanner.dart';
import 'package:code/Widgets/RecensioneForm.dart';
import 'package:code/Widgets/RecensioneHome.dart';
import 'package:code/Widgets/RegistrationScreen.dart';
import 'package:code/Widgets/SettingScreen.dart';
import 'package:code/main.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final args = settings.arguments;

  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
          builder: (_) => LibriMain(
                title: 'Libri App',
              ));
    case '/account':
      return MaterialPageRoute(builder: (_) => const AccountScreen());
    case '/libreria':
      return MaterialPageRoute(builder: (_) => const LibreriaHome());
    case '/qr':
      return MaterialPageRoute<String>(builder: (_) => const QRScanner());
    case '/recensione':
      if (args is RecensioneInput) {
        return MaterialPageRoute(
            builder: (_) => RecensioneHome(title: args.title, id: args.id));
      } else {
        return materialPageRouteError(
            "Pagina non disponibile o parametri sbaglati");
      }

    case '/recensioneForm':
      if (args is RecensioneFormInput) {
        return MaterialPageRoute(
            builder: (_) => RecensioneForm(
                  isbn: args.isbn,
                  voto: args.voto,
                  recensione: args.recensione,
                  periodo: args.periodo,
                  stato: args.stato,
                  valutazione: args.valutazione,
                  aggiunta: args.aggiunta,
                  libro: args.libro,
                ));
      } else {
        return materialPageRouteError(
            "Pagina non disponibile o parametri sbaglati");
      }
    case '/settings':
      return MaterialPageRoute(builder: (_) => const SettingScreen());

    case '/register':
      return MaterialPageRoute(builder: (_) => RegistrationScreen());

    default:
      return materialPageRouteError("Route not found");
  }
}

class RecensioneInput {
  final String title;
  final String id;

  RecensioneInput({required this.title, required this.id});
}

MaterialPageRoute materialPageRouteError(String text) {
  return MaterialPageRoute(
      builder: (_) => Scaffold(
            body: Center(
              child: Text(text),
            ),
          ));
}

class RecensioneFormInput {
  final LibroMinimo libro;
  final String isbn;
  final int voto;
  final String? recensione;
  final String? periodo;
  final Stato stato;
  final int valutazione;
  final bool aggiunta;

  RecensioneFormInput(
      {required this.libro,
      required this.isbn,
      required this.voto,
      this.recensione,
      this.periodo,
      this.stato = Stato.daComprare,
      this.valutazione = 1,
      this.aggiunta = true});
}

import 'package:code/Models/LibroMinimo.dart';
import 'package:code/Service/LibriService.dart';
import 'package:code/Widgets/LibreriaHome.dart';
import 'package:code/Widgets/LibriForm.dart';
import 'package:code/Widgets/QRScanner.dart';
import 'package:code/Widgets/RecensioneForm.dart';
import 'package:code/Widgets/RecensioneHome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String title = "Libri App";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData.dark(),
      home: LibriMain(
        title: title,
      ),
    );
  }
}

class LibriMain extends StatelessWidget {
  final String title;
  LibriMain({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Libri App"),
        ),
        body: const LibreriaHome(),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            String isbn = await Navigator.push(
                context, MaterialPageRoute(builder: (context) => QRScanner()));
            if (!isbn.isEmpty) {
              LibroMinimo libro = await LibriService.getLibroRidotto(isbn);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          RecensioneForm(libro: libro, voto: 2, isbn: isbn)));
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

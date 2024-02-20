import 'package:code/Widgets/LibreriaHome.dart';
import 'package:code/Widgets/LibriForm.dart';
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
      home: ComuniPage(
        title: title,
      ),
    );
  }
}

class ComuniPage extends StatelessWidget {
  final String title;
  ComuniPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.menu_book_sharp)),
              Tab(icon: Icon(Icons.library_add)),
            ],
          ),
          title: const Text('Libri App'),
        ),
        body: const TabBarView(
          children: [
            RecensioneHome(id: "Dd9N0AEACAAJ", title: "1984"),
            LibreriaHome(),
          ],
        ),
      ),
    );
  }
}

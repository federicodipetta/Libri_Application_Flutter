import 'package:code/Widgets/LibriForm.dart';
import 'package:code/Widgets/LibriHome.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.menu_book_sharp)),
                Tab(icon: Icon(Icons.library_add)),
              ],
            ),
            title: const Text('Tabs Demo'),
          ),
          body: const TabBarView(
            children: [
              RecensioneHome(),
              LibriForm(),
            ],
          ),
        ),
      ),
    );
  }
}

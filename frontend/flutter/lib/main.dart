import 'package:code/Models/LibroMinimo.dart';
import 'package:code/Providers/AuthProvider.dart';
import 'package:code/Providers/RecensioneProvider.dart';
import 'package:code/Providers/ThemeProvider.dart';
import 'package:code/Router.dart';
import 'package:code/Service/LibriService.dart';
import 'package:code/Widgets/LibreriaHome.dart';
import 'package:code/Widgets/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AuthProvider.init();
  ThemeProvider.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ChangeNotifierProvider(create: (context) => AuthProvider()),
    ChangeNotifierProvider(create: (context) => RecensioneProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  final String title = "Libri App";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      themeMode: context.watch<ThemeProvider>().theme,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      onGenerateRoute: generateRoute,
    );
  }
}

class LibriMain extends StatelessWidget {
  final String title;
  const LibriMain({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !context.watch<AuthProvider>().isLogged
        ? const LoginScreen()
        : DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                title: const Text("Libri App"),
                actions: [
                  IconButton(
                      onPressed: () =>
                          {Navigator.of(context).pushNamed('/settings')},
                      icon: Icon(Icons.settings))
                ],
              ),
              body: const LibreriaHome(),
              floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  String isbn =
                      await Navigator.of(context).pushNamed('/qr') ?? "";
                  if (!isbn.isEmpty) {
                    LibroMinimo libro =
                        await LibriService.getLibroRidotto(isbn);
                    Navigator.of(context).pushNamed('/recensioneForm',
                        arguments: RecensioneFormInput(
                            libro: libro, voto: 1, isbn: isbn, aggiunta: true));
                  }
                },
                child: const Icon(Icons.add),
              ),
            ),
          );
  }
}

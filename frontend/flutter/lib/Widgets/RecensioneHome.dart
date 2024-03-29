import 'package:code/Providers/RecensioneProvider.dart';
import 'package:code/Router.dart';
import 'package:code/Widgets/RecensioneForm.dart';
import 'package:code/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../Models/Libro.dart';

class RecensioneHome extends StatefulWidget {
  final String id;
  final String title;
  const RecensioneHome({Key? key, required this.id, required this.title})
      : super(key: key);
  @override
  _stateRecensioneHome createState() => _stateRecensioneHome();
}

class _stateRecensioneHome extends State<RecensioneHome> {
  bool _isDelete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
          future: !_isDelete
              ? context.watch<RecensioneProvider>().getRecensione(widget.id)
              : null,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Stack(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              libro(context, snapshot.data!.libro,
                                  snapshot.data!.voto),
                              const SizedBox(height: 4),
                              categorie(snapshot.data!.libro.categorie),
                              Text(
                                'Descrizione',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(height: 5),
                              ExpansionTile(
                                title: Text(
                                    'Descrizione \n${snapshot.data!.libro.descrizione.substring(0, 40)}...'),
                                children: [
                                  Text(
                                    snapshot.data!.libro.descrizione,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                    textAlign: TextAlign.justify,
                                  )
                                ],
                              ),
                            ]),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Card(
                          color: Theme.of(context).cardColor,
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'Periodo',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  snapshot.data!.periodo,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Recensione',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  snapshot.data!.recensione,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: FloatingActionButton(
                      heroTag: 'edit',
                      child: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.pushNamed(context, '/recensioneForm',
                            arguments: RecensioneFormInput(
                              libro: snapshot.data!.libro.toLibroMinimo(),
                              voto: snapshot.data!.voto,
                              isbn: snapshot.data!.libro.isbn,
                              recensione: snapshot.data!.recensione,
                              periodo: snapshot.data!.periodo,
                              valutazione: snapshot.data!.voto,
                              aggiunta: false,
                              stato: snapshot.data!.stato,
                            ));
                      },
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      left: 10,
                      child: FloatingActionButton(
                        heroTag: 'delete',
                        child: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            _isDelete = true;
                          });
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Delete'),
                                  content: const Text(
                                      'Are you sure you want to delete this review?'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Cancel')),
                                    TextButton(
                                        onPressed: () {
                                          Provider.of<RecensioneProvider>(
                                                  context,
                                                  listen: false)
                                              .deleteRecensione(
                                                  snapshot.data!.libro.id)
                                              .then((value) => Navigator
                                                      .pushNamedAndRemoveUntil(
                                                    context,
                                                    '/',
                                                    (Route<dynamic> route) =>
                                                        false,
                                                  ));
                                        },
                                        child: const Text('Delete'))
                                  ],
                                );
                              });
                        },
                      ))
                ]),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }

  Widget libro(BuildContext context, Libro libro, int voto) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary,
              width: 2.3,
            ),
          ),
          child: Image.network(
            libro.img,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                libro.titolo,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 5),
              Text(
                libro.autori.join(", "),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 5),
              Text(
                'isbn : ' + libro.isbn,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 5),
              Text(
                libro.editore,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 5),
              Text(
                libro.anno,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 5),
              votoWidget(voto),
            ],
          ),
        ),
      ],
    );
  }

  Widget votoWidget(int voto) {
    return RatingBarIndicator(
        itemBuilder: (context, index) {
          return const Icon(
            Icons.star,
            color: Colors.amber,
          );
        },
        rating: voto.toDouble(),
        itemCount: 5,
        itemSize: 25,
        direction: Axis.horizontal);
  }

  Widget categorie(List<String> categorie) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categorie.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(2),
            child: Chip(
              padding: const EdgeInsets.all(2),
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              label: Text(categorie[index]),
            ),
          );
        },
      ),
    );
  }
}

import 'package:code/Service/LibriService.dart';
import 'package:code/Service/RecensioneService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Models/Libro.dart';

class RecensioneHome extends StatelessWidget {
  const RecensioneHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: RecensioneService.getRecensione("1"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //TODO : fare la visualizzazione per le recensioni
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  libro(context, snapshot.data!.libro, snapshot.data!.voto),
                  const SizedBox(height: 10),
                  Card(
                    color: Theme.of(context).primaryColor,
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Descrizione',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            snapshot.data!.libro.descrizione,
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    color: Theme.of(context).primaryColor,
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Review',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            snapshot.data!.recensione,
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(child: const CircularProgressIndicator());
        });
  }

  Widget libro(BuildContext context, Libro libro, int voto) {
    return Card(
      color: Theme.of(context).primaryColor,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Theme.of(context).colorScheme.onPrimary,
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
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    libro.anno,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(height: 5),
                  votoWidget(voto),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget votoWidget(int voto) {
    return Row(
      children: [
        for (var i = 0; i < voto; i++)
          Icon(
            Icons.star,
            color: Colors.yellow,
          ),
        for (var i = 0; i < 5 - voto; i++)
          Icon(
            Icons.star,
            color: Colors.grey,
          ),
      ],
    );
  }
}

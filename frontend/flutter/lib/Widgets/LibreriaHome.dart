import 'package:code/Models/Libro.dart';
import 'package:code/Models/LibroMinimo.dart';
import 'package:code/Service/RecensioneService.dart';
import 'package:code/Widgets/RecensioneHome.dart';
import 'package:flutter/material.dart';

class LibreriaHome extends StatelessWidget {
  const LibreriaHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: RecensioneService.getRecensioni(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return libro(context, snapshot.data![index].libro,
                    snapshot.data![index].voto);
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  Widget votoWidget(int voto) {
    return Row(
      children: [
        for (var i = 0; i < 5; i++)
          Icon(
            i < voto ? Icons.star : Icons.star_border,
          ),
      ],
    );
  }

  Widget libro(BuildContext context, LibroMinimo libro, int voto) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  RecensioneHome(id: libro.id, title: libro.titolo))),
      child: Card(
        color: Theme.of(context).cardColor,
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
                    votoWidget(voto),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

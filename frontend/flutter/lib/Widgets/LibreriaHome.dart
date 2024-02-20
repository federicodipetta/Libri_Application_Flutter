import 'package:code/Models/Libro.dart';
import 'package:code/Widgets/RecensioneHome.dart';
import 'package:flutter/material.dart';

class LibreriaHome extends StatelessWidget {
  const LibreriaHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return libro(
            context,
            Libro(
              titolo: "titolo",
              id: index.toString(),
              autori: ["autore"],
              isbn: "isbn",
              editore: "editore",
              anno: "anno",
              img:
                  "http://books.google.com/books/content?id=Dd9N0AEACAAJ&printsec=frontcover&img=1&zoom=5&imgtk=AFLRE71wyM7oBNWlqPDrWiowoxQ7Lt_WGHsor2k_v96D2119k9imkxBooNyAHPcdJv2kXftX20cLjPuEQdQtZltuG4hJE6EjSORU3UJFn8AGR9gKWHUUUvRaG3ZvcQO5bkcuj8KPUS55&source=gbs_api",
              descrizione: "descrizione",
            ),
            5);
      },
    );
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

  Widget libro(BuildContext context, Libro libro, int voto) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  RecensioneHome(id: "Dd9N0AEACAAJ", title: libro.titolo))),
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
          ),
        ),
      ),
    );
  }
}

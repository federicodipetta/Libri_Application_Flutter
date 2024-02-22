import 'package:code/Models/LibroMinimo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class LibroMinimoWidget extends StatelessWidget {
  final LibroMinimo libro;
  final int voto;

  LibroMinimoWidget({required this.libro, required this.voto});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 100,
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
                    libro.autori[0],
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 5),
                  if (voto >= 0) votoWidget(voto),
                ],
              ),
            ),
          ],
        ),
      ),
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
}

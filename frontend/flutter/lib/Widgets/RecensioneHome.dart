import 'package:code/Service/LibriService.dart';
import 'package:code/Service/RecensioneService.dart';
import 'package:flutter/material.dart';

class RecensioneHome extends StatelessWidget {
  const RecensioneHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: RecensioneService.getRecensione("1"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //TODO : fare la visualizzazione per le recensioni
            return Text(snapshot.data!.recensione);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(child: const CircularProgressIndicator());
        });
  }
}

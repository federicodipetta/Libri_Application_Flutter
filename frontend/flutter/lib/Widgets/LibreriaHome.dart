import 'package:code/Models/Libro.dart';
import 'package:code/Models/LibroMinimo.dart';
import 'package:code/Providers/RecensioneProvider.dart';
import 'package:code/Service/LibriService.dart';
import 'package:code/Service/RecensioneService.dart';
import 'package:code/Widgets/LibroMinimoWidget.dart';
import 'package:code/Widgets/RecensioneHome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LibreriaHome extends StatelessWidget {
  const LibreriaHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context.watch<RecensioneProvider>().recensioni,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecensioneHome(
                              id: snapshot.data![index].libro.id,
                              title: snapshot.data![index].libro.titolo))),
                  child: LibroMinimoWidget(
                      libro: snapshot.data![index].libro,
                      voto: snapshot.data![index].voto),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}

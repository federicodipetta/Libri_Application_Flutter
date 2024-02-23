import 'package:code/Providers/RecensioneProvider.dart';
import 'package:code/Router.dart';
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
                  onTap: () => Navigator.of(context).pushNamed('/recensione',
                      arguments: RecensioneInput(
                        title: snapshot.data![index].libro.titolo,
                        id: snapshot.data![index].libro.id,
                      )),
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

import 'package:code/LibriService.dart';
import 'package:flutter/material.dart';

class LibriHome extends StatelessWidget {
  const LibriHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: LibriService.getLibri(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index].titolo),
                    subtitle: Text(snapshot.data![index].autore),
                  );
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        });
  }
}

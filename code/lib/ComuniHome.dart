import 'package:code/comuniService.dart';
import 'package:flutter/material.dart';

class ComuniHome extends StatelessWidget {
  const ComuniHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ComuniService.getComuniAggiunti(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data![index].nome),
                subtitle: Text(snapshot.data![index].provincia),
              );
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

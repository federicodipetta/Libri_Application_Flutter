import 'package:code/Providers/UtenteProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
      ),
      body: FutureBuilder(
          future: context.watch<UtenteProvider>().utente,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: [
                  ListTile(
                    title: Text(snapshot.data!.nome),
                    leading: const Icon(Icons.account_circle),
                  ),
                  ListTile(
                    title: Text(snapshot.data!.mail),
                    leading: const Icon(Icons.mail),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}

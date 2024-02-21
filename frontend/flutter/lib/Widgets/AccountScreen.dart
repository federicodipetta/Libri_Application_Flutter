import 'package:code/Widgets/LibreriaHome.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text("nome"),
            leading: const Icon(Icons.account_circle),
          ),
          ListTile(
            title: Text("mail"),
            leading: const Icon(Icons.mail),
          )
        ],
      ),
    );
  }
}

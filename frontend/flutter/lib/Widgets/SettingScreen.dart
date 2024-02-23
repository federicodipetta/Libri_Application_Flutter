import 'package:code/Providers/AuthProvider.dart';
import 'package:code/Providers/ThemeProvider.dart';
import 'package:code/Widgets/AccountScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Account"),
            leading: const Icon(Icons.account_circle),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AccountScreen()));
            },
          ),
          ListTile(
            title: const Text("Logout"),
            leading: const Icon(Icons.logout),
            onTap: () {
              context.read<AuthProvider>().logout();
              Navigator.pop(context);
            },
          ),
          Switch(
              thumbIcon: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return const Icon(Icons.nightlight_round_sharp);
                } else {
                  return const Icon(
                    Icons.wb_sunny,
                    color: Colors.amber,
                  );
                }
              }),
              value: context.watch<ThemeProvider>().theme == ThemeMode.dark,
              onChanged: (_) =>
                  Provider.of<ThemeProvider>(context, listen: false)
                      .ChangeTheme())
        ],
      ),
    );
  }
}

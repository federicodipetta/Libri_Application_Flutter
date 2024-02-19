import 'package:code/Service/LibriService.dart';
import 'package:flutter/material.dart';

class LibriForm extends StatefulWidget {
  const LibriForm({Key? key}) : super(key: key);

  @override
  _LibriFormState createState() => _LibriFormState();
}

class _LibriFormState extends State<LibriForm> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "inserisci l'isbn del libro da aggiungere",
          ),
          TextField(
            controller: controller,
          ),
          ElevatedButton(
            onPressed: () {
              LibriService.addLibro(controller.text);
            },
            child: const Text('Submit'),
          )
        ],
      ),
    );
  }
}

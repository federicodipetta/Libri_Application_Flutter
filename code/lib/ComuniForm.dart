import 'package:code/comuniService.dart';
import 'package:flutter/material.dart';

class ComuniForm extends StatefulWidget {
  const ComuniForm({super.key});

  @override
  _ComuniFormState createState() => _ComuniFormState();
}

class _ComuniFormState extends State<ComuniForm> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Inserisci il nome del comune',
          ),
          TextField(
            controller: controller,
          ),
          ElevatedButton(
            onPressed: () {
              ComuniService.addComune(controller.text);
            },
            child: const Text('Submit'),
          )
        ],
      ),
    );
  }
}

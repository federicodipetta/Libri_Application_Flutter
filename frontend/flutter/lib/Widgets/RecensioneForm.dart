import 'dart:ffi';

import 'package:code/Models/LibroMinimo.dart';
import 'package:code/Models/Stato.dart';
import 'package:code/Service/RecensioneService.dart';
import 'package:code/Widgets/LibroMinimoWidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RecensioneForm extends StatefulWidget {
  final LibroMinimo libro;
  final int voto;
  final String isbn;
  const RecensioneForm({
    Key? key,
    required this.libro,
    required this.voto,
    required this.isbn,
  }) : super(key: key);

  @override
  _RecensioneFormState createState() => _RecensioneFormState();
}

class _RecensioneFormState extends State<RecensioneForm> {
  final _formKey = GlobalKey<FormState>();
  final _periodoController = TextEditingController();
  final _recensioneController = TextEditingController();
  int optionValue = 0;
  int votazione = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aggiungi Recensione'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LibroMinimoWidget(libro: widget.libro, voto: -1),
            Card(
                color: Theme.of(context).cardColor,
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _periodoController,
                          decoration: const InputDecoration(
                            labelText: 'Periodo',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Inserire un periodo';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _recensioneController,
                          maxLines: 10,
                          decoration: const InputDecoration(
                            labelText: 'Recensione',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Inserire una recensione';
                            }
                            return null;
                          },
                        ),
                        DropdownButton<int>(
                          value: optionValue,
                          items: <Stato>[
                            Stato.daComprare,
                            Stato.comprato,
                            Stato.letto,
                            Stato.recensito,
                          ].map<DropdownMenuItem<int>>((Stato value) {
                            return DropdownMenuItem<int>(
                              value: Stato.statoToInt(value),
                              child: Text(Stato.statoToString(value)),
                            );
                          }).toList(),
                          onChanged: (int? newValue) {
                            setState(() {
                              optionValue = newValue ?? 0;
                            });
                          },
                        ),
                        RatingBar.builder(
                          itemBuilder: (context, index) =>
                              const Icon(Icons.star, color: Colors.amber),
                          onRatingUpdate: (rating) {
                            votazione = rating.toInt();
                          },
                          itemCount: 5,
                          allowHalfRating: false,
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor:
                                Theme.of(context).colorScheme.inversePrimary,
                            backgroundColor:
                                Theme.of(context).colorScheme.tertiary,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              RecensioneService.addRecensione(
                                  widget.isbn,
                                  _recensioneController.text,
                                  votazione,
                                  optionValue,
                                  _periodoController.text);
                              Navigator.pop(context);
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

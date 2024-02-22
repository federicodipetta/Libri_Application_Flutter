import 'dart:ffi';

import 'package:code/Models/LibroMinimo.dart';
import 'package:code/Models/Stato.dart';
import 'package:code/Providers/RecensioneProvider.dart';
import 'package:code/Service/RecensioneService.dart';
import 'package:code/Widgets/LibroMinimoWidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class RecensioneForm extends StatefulWidget {
  final LibroMinimo libro;
  final int voto;
  final String isbn;
  final String? recensione;
  final String? periodo;
  final Stato stato;
  final int valutazione;
  final bool aggiunta;
  const RecensioneForm(
      {Key? key,
      required this.libro,
      required this.voto,
      required this.isbn,
      this.recensione,
      this.periodo,
      this.stato = Stato.daComprare,
      this.valutazione = 1,
      this.aggiunta = true})
      : super(key: key);

  @override
  _RecensioneFormState createState() => _RecensioneFormState();
}

class _RecensioneFormState extends State<RecensioneForm> {
  final _formKey = GlobalKey<FormState>();
  final _periodoController = TextEditingController();
  final _recensioneController = TextEditingController();
  Stato optionValue = Stato.daComprare;
  int votazione = 1;
  @override
  void initState() {
    super.initState();
    if (!widget.aggiunta) {
      _recensioneController.text = widget.recensione ?? "";
      _periodoController.text = widget.periodo ?? "";
      optionValue = widget.stato;
      votazione = widget.valutazione;
    }
  }

  @override
  Widget build(BuildContext context) {
    //inizializzo i valori se è una form per la modifica
    String appbatText =
        widget.aggiunta ? "Aggiungi Recensione" : "Modifica Recensione";

    return Scaffold(
      appBar: AppBar(
        title: Text(appbatText),
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
                        DropdownButton<Stato>(
                          value: optionValue,
                          items: <Stato>[
                            Stato.daComprare,
                            Stato.comprato,
                            Stato.letto,
                            Stato.recensito,
                          ].map<DropdownMenuItem<Stato>>((Stato value) {
                            return DropdownMenuItem<Stato>(
                              value: value,
                              child: Text(Stato.statoToString(value)),
                            );
                          }).toList(),
                          onChanged: (Stato? newValue) {
                            setState(() {
                              optionValue = newValue ?? Stato.daComprare;
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
                          initialRating: votazione.toDouble(),
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
                              if (widget.aggiunta) {
                                Provider.of<RecensioneProvider>(context,
                                        listen: false)
                                    .addRecensione(
                                        widget.isbn,
                                        _recensioneController.text,
                                        votazione,
                                        optionValue,
                                        _periodoController.text);
                              } else {
                                Provider.of<RecensioneProvider>(context,
                                        listen: false)
                                    .modificaRecensione(
                                        widget.libro.id,
                                        _recensioneController.text,
                                        votazione,
                                        optionValue,
                                        _periodoController.text);
                              }
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

import 'package:flutter/material.dart';
import '../db/nachhilfe_services.dart';

class NeueNachhilfe extends StatefulWidget {
  final Function addNx;

  NeueNachhilfe(this.addNx);

  @override
  State<NeueNachhilfe> createState() => _NeueNachhilfeState();
}

class _NeueNachhilfeState extends State<NeueNachhilfe> {
  final fachController = TextEditingController();
  final beschreibungController = TextEditingController();
  final jahrgangsstufeController = TextEditingController();

  final _jahrgangFocusNode = FocusNode();
  final _beschreibungFocusNode = FocusNode();

  void submitData() {
    final enteredFach = fachController.text;
    final enteredJahrgang = jahrgangsstufeController.text;
    //final enteredBeschreibung = beschreibungController.text; wird nicht gebraucht, da dieser Wert Null sein darf.

    if (enteredFach.isEmpty || enteredJahrgang.isEmpty) {
      return;
    }

    ServicesNachhilfe.addNachhilfe(fachController.text,
        jahrgangsstufeController.text, beschreibungController.text);

    widget.addNx(
      fachController.text,
      jahrgangsstufeController.text,
      beschreibungController.text,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(10, 15, 10, 5),
          child: const Text(
            'Neues Angebot',
            style: TextStyle(fontSize: 28),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: TextField(
            decoration: const InputDecoration(labelText: 'Fach'),
            controller: fachController,
            onSubmitted: (_) {
              FocusScope.of(context).requestFocus(_jahrgangFocusNode);
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: TextField(
            decoration: const InputDecoration(
                labelText: 'Angesprochene Jahrgangsstufe'),
            controller: jahrgangsstufeController,
            focusNode: _jahrgangFocusNode,
            onSubmitted: (_) {
              FocusScope.of(context).requestFocus(_beschreibungFocusNode);
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: TextField(
            decoration: const InputDecoration(labelText: 'Beschreibung'),
            controller: beschreibungController,
            focusNode: _beschreibungFocusNode,
            onSubmitted: (_) => submitData(),
          ),
        ),
        TextButton(
          child: const Text('Hinzufügen'),
          onPressed: submitData,
        ),
      ],
    );
  }
}

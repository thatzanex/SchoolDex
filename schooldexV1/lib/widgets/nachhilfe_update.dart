import 'package:flutter/material.dart';
import '../db/nachhilfe_services.dart';

class UpdateNachhilfe extends StatefulWidget {
  final Function updateNx;

  UpdateNachhilfe(this.updateNx, this.id, this.fach, this.jahrgang,
      this.beschreibung, this.userId, this.username, this.schulname);
  final String id;
  final String fach;
  final String jahrgang;
  final String beschreibung;
  final String userId;
  final String username;
  final String schulname;

  @override
  State<UpdateNachhilfe> createState() => _UpdateNachhilfeState();
}

class _UpdateNachhilfeState extends State<UpdateNachhilfe> {
  final fachController = TextEditingController();
  final beschreibungController = TextEditingController();
  final jahrgangsstufeController = TextEditingController();

  final _jahrgangFocusNode = FocusNode();
  final _beschreibungFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    fachController.text = widget.fach;
    jahrgangsstufeController.text = widget.jahrgang;
    beschreibungController.text = widget.beschreibung;
  }

  void submitData() {
    final enteredFach = fachController.text;
    final enteredJahrgang = jahrgangsstufeController.text;
    //final enteredBeschreibung = beschreibungController.text; wird nicht gebraucht, da dieser Wert Null sein darf.

    if (enteredFach.isEmpty || enteredJahrgang.isEmpty) {
      return;
    }

    // ServicesNachhilfe.addNachhilfe(fachController.text,
    //     jahrgangsstufeController.text, beschreibungController.text);

    widget.updateNx(
        widget.id,
        fachController.text,
        jahrgangsstufeController.text,
        beschreibungController.text,
        widget.userId,
        widget.username,
        widget.schulname);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(10, 15, 10, 5),
          child: const Text(
            'Angebot bearbeiten',
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
          child: const Text('Speichern'),
          onPressed: submitData,
        ),
      ],
    );
  }
}

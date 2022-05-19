import 'package:flutter/material.dart';

class UpdateAGs extends StatefulWidget {
  final Function updateAx;

  UpdateAGs(this.updateAx, this.id, this.thema, this.jahrgang,
      this.beschreibung, this.termin);
  final String id;
  final String thema;
  final String jahrgang;
  final String beschreibung;
  final String termin;

  @override
  State<UpdateAGs> createState() => _UpdateAGsState();
}

class _UpdateAGsState extends State<UpdateAGs> {
  final themaController = TextEditingController();
  final beschreibungController = TextEditingController();
  final jahrgangsstufeController = TextEditingController();
  final terminController = TextEditingController();

  final _jahrgangFocusNode = FocusNode();
  final _terminFocusNode = FocusNode();
  final _beschreibungFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    themaController.text = widget.thema;
    jahrgangsstufeController.text = widget.jahrgang;
    beschreibungController.text = widget.beschreibung;
    terminController.text = widget.termin;
  }

  void submitData() {
    final enteredThema = themaController.text;
    final enteredJahrgang = jahrgangsstufeController.text;
    //final enteredBeschreibung = beschreibungController.text;
    //ist unnötig geworden, da die Beschreibung nicht mehr zwingend ist
    final enteredTermin = terminController.text;

    if (enteredThema.isEmpty ||
        enteredJahrgang.isEmpty ||
        enteredTermin.isEmpty) {
      return;
    }

    widget.updateAx(
      widget.id,
      themaController.text,
      jahrgangsstufeController.text,
      beschreibungController.text,
      terminController.text,
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
            'Neues AG Angebot',
            style: TextStyle(fontSize: 28),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: TextField(
              decoration: const InputDecoration(labelText: 'Thema'),
              controller: themaController,
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(_jahrgangFocusNode);
              }),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: TextField(
              decoration: const InputDecoration(
                  labelText: 'Angesprochene Jahrgangsstufe'),
              controller: jahrgangsstufeController,
              focusNode: _jahrgangFocusNode,
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(_terminFocusNode);
              }),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: TextField(
              decoration: const InputDecoration(labelText: 'Termin'),
              controller: terminController,
              focusNode: _terminFocusNode,
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(_beschreibungFocusNode);
              }),
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

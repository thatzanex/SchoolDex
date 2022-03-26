import 'package:flutter/material.dart';

class NeueAG extends StatefulWidget {
  final Function addAx;

  NeueAG(this.addAx);

  @override
  State<NeueAG> createState() => _NeueAGState();
}

class _NeueAGState extends State<NeueAG> {
  final themaController = TextEditingController();
  final beschreibungController = TextEditingController();
  final jahrgangsstufeController = TextEditingController();
  final terminController = TextEditingController();

  void submitData() {
    final enteredThema = themaController.text;
    final enteredJahrgang = jahrgangsstufeController.text;
    final enteredBeschreibung = beschreibungController.text;
    final enteredTermin = terminController.text;

    if (enteredThema.isEmpty ||
        enteredJahrgang.isEmpty ||
        enteredBeschreibung.isEmpty ||
        enteredTermin.isEmpty) {
      return;
    }

    widget.addAx(
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
          margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
          child: Text(
            'Neues AG Angebot',
            style: TextStyle(fontSize: 28),
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          child: TextField(
            decoration: InputDecoration(labelText: 'Thema'),
            controller: themaController,
            onSubmitted: (_) => submitData(),
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          child: TextField(
            decoration:
                InputDecoration(labelText: 'Angesprochene Jahrgangsstufe'),
            controller: jahrgangsstufeController,
            onSubmitted: (_) => submitData(),
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          child: TextField(
            decoration: InputDecoration(labelText: 'Termin'),
            controller: terminController,
            onSubmitted: (_) => submitData(),
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          child: TextField(
            decoration: InputDecoration(labelText: 'Beschreibung'),
            controller: beschreibungController,
            onSubmitted: (_) => submitData(),
          ),
        ),
        TextButton(
          child: Text('Hinzufügen'),
          onPressed: submitData,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

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
    //final enteredBeschreibung = beschreibungController.text;
    Color colorCard;

    if (enteredFach.isEmpty || enteredJahrgang.isEmpty) {
      return;
    }

    if (enteredFach.startsWith('Mathe')) {
      colorCard = Colors.blue.shade300;
    } else if (enteredFach.startsWith('Deutsch')) {
      colorCard = Colors.orange;
    } else if (enteredFach.startsWith('Fran')) {
      colorCard = Colors.red;
    } else if (enteredFach.startsWith('Englis')) {
      colorCard = Colors.yellow.shade600;
    } else if (enteredFach.startsWith('Bio')) {
      colorCard = Colors.green.shade400;
    } else if (enteredFach.startsWith('Chemie')) {
      colorCard = Colors.grey;
    } else if (enteredFach.startsWith('Physik')) {
      colorCard = Colors.blue.shade100;
    } else {
      colorCard = Colors.grey.shade200;
    }

    widget.addNx(
      fachController.text,
      jahrgangsstufeController.text,
      beschreibungController.text,
      colorCard,
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

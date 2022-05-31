import 'package:flutter/material.dart';

class NeueAG extends StatefulWidget {
  final Function addAx;
  final String schulname;
  final String userId;

  NeueAG(this.addAx, this.schulname, this.userId);

  @override
  State<NeueAG> createState() => _NeueAGState();
}

class _NeueAGState extends State<NeueAG> {
  final themaController = TextEditingController();
  final beschreibungController = TextEditingController();
  final jahrgangsstufeController = TextEditingController();
  final terminController = TextEditingController();

  final _jahrgangFocusNode = FocusNode();
  final _terminFocusNode = FocusNode();
  final _beschreibungFocusNode = FocusNode();

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

    widget.addAx(
        themaController.text,
        jahrgangsstufeController.text,
        beschreibungController.text,
        terminController.text,
        widget.schulname,
        widget.userId);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Column(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: const Text(
                  'Hinzufügen',
                  style: TextStyle(
                    color: Color.fromARGB(255, 29, 44, 89),
                  ),
                ),
                onPressed: submitData,
              ),
              IconButton(
                onPressed: (() => Navigator.of(context).pop()),
                icon: const Icon(Icons.close),
                color: const Color.fromARGB(255, 29, 44, 89),
              )
            ],
          ),
        ],
      ),
    );
  }
}

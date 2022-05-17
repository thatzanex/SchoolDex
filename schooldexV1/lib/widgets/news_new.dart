import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NeueNews extends StatefulWidget {
  final Function addNx;

  NeueNews(this.addNx);

  @override
  State<NeueNews> createState() => _NeueNewsState();
}

class _NeueNewsState extends State<NeueNews> {
  final ueberschriftenController = TextEditingController();
  final inhaltController = TextEditingController();

  final _newsFocusNode = FocusNode();

  void submitData() {
    final enteredUeberschrift = ueberschriftenController.text;
    final enteredInhalt = inhaltController.text;
    String datum = DateFormat('dd.MM.yyyy').format(DateTime.now());

    if (enteredUeberschrift.isEmpty || enteredInhalt.isEmpty) {
      return;
    }

    widget.addNx(
      ueberschriftenController.text,
      inhaltController.text,
      datum,
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
            'News hinzufügen',
            style: TextStyle(fontSize: 28),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: TextField(
              decoration: const InputDecoration(labelText: 'Überschrift'),
              controller: ueberschriftenController,
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(_newsFocusNode);
              }),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: TextField(
            decoration: const InputDecoration(labelText: 'Inhalt'),
            controller: inhaltController,
            focusNode: _newsFocusNode,
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

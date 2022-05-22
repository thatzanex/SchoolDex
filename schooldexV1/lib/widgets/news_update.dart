import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UpdateNews extends StatefulWidget {
  final Function updateNx;

  UpdateNews(this.updateNx, this.id, this.ueberschrift, this.inhalt, this.datum,
      this.schulname, this.userId);
  final String id;
  final String ueberschrift;
  final String inhalt;
  final String datum;
  final String schulname;
  final String userId;

  @override
  State<UpdateNews> createState() => _UpdateNewsState();
}

class _UpdateNewsState extends State<UpdateNews> {
  var ueberschriftenController = TextEditingController();
  var inhaltController = TextEditingController();

  final _newsFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    ueberschriftenController.text = widget.ueberschrift;
    inhaltController.text = widget.inhalt;
  }

  void submitData() {
    final enteredUeberschrift = ueberschriftenController.text;
    final enteredInhalt = inhaltController.text;
    String entereddatum = DateFormat('dd.MM.yyyy').format(DateTime.now());

    if (enteredUeberschrift.isEmpty || enteredInhalt.isEmpty) {
      return;
    }

    widget.updateNx(widget.id, ueberschriftenController.text,
        inhaltController.text, entereddatum, widget.schulname, widget.userId);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(10, 15, 10, 5),
          child: const Text(
            'News bearbeiten',
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
          child: const Text('Speichern'),
          onPressed: submitData,
        ),
      ],
    );
  }
}

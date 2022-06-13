import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UpdateBlackboard extends StatefulWidget {
  final Function updateNx;

  UpdateBlackboard(this.updateNx, this.id, this.fach, this.beschreibung,
      this.color, this.userId, this.username, this.schulname);
  final String id;
  final String fach;
  final String beschreibung;
  final String color;
  final String userId;
  final String username;
  final String schulname;

  @override
  State<UpdateBlackboard> createState() => _UpdateBlackboardState();
}

class _UpdateBlackboardState extends State<UpdateBlackboard> {
  final fachController = TextEditingController();
  final beschreibungController = TextEditingController();
  String datum = DateFormat('dd.MM.yyyy').format(DateTime.now());

  final _beschreibungFocusNode = FocusNode();

  String selectedValue = '5';

  @override
  void initState() {
    super.initState();
    selectedValue = widget.color;
    fachController.text = widget.fach;
    beschreibungController.text = widget.beschreibung;
  }

  void submitData() {
    final enteredFach = fachController.text;
    final enteredBeschreibung = beschreibungController.text;

    if (enteredFach.isEmpty || enteredBeschreibung.isEmpty) {
      return;
    }

    widget.updateNx(widget.id, fachController.text, beschreibungController.text,
        selectedValue, datum, widget.userId, widget.username, widget.schulname);
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Row(
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: const Text(
                        'Farbe der Kachel:',
                        style: TextStyle(fontSize: 15),
                      )),
                  DropdownButton(
                      value: selectedValue,
                      items: const [
                        DropdownMenuItem(
                          value: 1,
                          child: Text('Rot'),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text('Grün'),
                        ),
                        DropdownMenuItem(
                          value: 3,
                          child: Text('Blau'),
                        ),
                        DropdownMenuItem(
                          value: 4,
                          child: Text('Gelb'),
                        ),
                        DropdownMenuItem(
                          value: 5,
                          child: Text('Orange'),
                        ),
                      ],
                      onChanged: (value) {
                        selectedValue = value.toString();
                      }),
                ],
              ),
            ),
          ),
          TextButton(
            child: const Text('Speichern'),
            onPressed: submitData,
          ),
        ],
      ),
    );
  }
}

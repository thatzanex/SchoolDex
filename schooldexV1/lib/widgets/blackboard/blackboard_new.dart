import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NeueBlackboard extends StatefulWidget {
  final Function addNx;
  final String userId;
  final String username;
  final String schulname;

  NeueBlackboard(this.addNx, this.userId, this.username, this.schulname);

  @override
  State<NeueBlackboard> createState() => _NeueBlackboardState();
}

class _NeueBlackboardState extends State<NeueBlackboard> {
  final ueberschriftController = TextEditingController();
  final beschreibungController = TextEditingController();
  String datum = DateFormat('dd.MM.yyyy').format(DateTime.now());

  final _beschreibungFocusNode = FocusNode();

  String selectedValue = '5';

  void submitData() {
    final enteredueberschrift = ueberschriftController.text;
    final enteredBeschreibung = beschreibungController.text;

    if (enteredueberschrift.isEmpty || enteredBeschreibung.isEmpty) {
      return;
    }

    widget.addNx(ueberschriftController.text, beschreibungController.text,
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
              'Neuer Eintrag',
              style: TextStyle(fontSize: 28),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: TextField(
              decoration: const InputDecoration(labelText: 'Überschrift'),
              controller: ueberschriftController,
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
                      value: int.parse(selectedValue),
                      items: [
                        const DropdownMenuItem(
                          value: 1,
                          child: Text(
                            'Rot',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text(
                            'Grün',
                            style: TextStyle(color: Colors.green.shade400),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 3,
                          child: Text(
                            'Blau',
                            style: TextStyle(color: Colors.indigo.shade400),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 4,
                          child: Text(
                            'Gelb',
                            style: TextStyle(color: Colors.yellow.shade600),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 5,
                          child: Text(
                            'Orange',
                            style: TextStyle(color: Colors.orange.shade700),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value.toString();
                        });
                      }),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: Text(
                  'Hinzufügen',
                  style: TextStyle(
                    color: Colors.orange.shade700,
                  ),
                ),
                onPressed: () => submitData(),
              ),
              IconButton(
                onPressed: (() => Navigator.of(context).pop()),
                icon: const Icon(Icons.close),
                color: Colors.orange.shade700,
              )
            ],
          ),
        ],
      ),
    );
  }
}

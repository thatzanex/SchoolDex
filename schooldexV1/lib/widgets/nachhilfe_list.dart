import 'package:flutter/material.dart';
import '../models/nachhilfe.dart';
import 'popup.dart';
import '../services.dart';

class NachhilfeListe extends StatefulWidget {
  //List<Nachhilfe> nachhilfen;
  //NachhilfeListe(this.nachhilfen);
  @override
  State<NachhilfeListe> createState() => _NachhilfeListeState();
}

class _NachhilfeListeState extends State<NachhilfeListe> {
  List<Nachhilfe> _nachhilfen = [
    Nachhilfe(
      fach: 'Mathematik',
      jahrgang: '8',
      beschreibung:
          'Ich würde mich freuen, wenn ich euer neuer Nachhilfelehrer werden würde. Ihr könnt mich erreichen unter +49 123 4567890',
    ),
  ];
  Color colorCard = Colors.grey.shade200;

  void initState() {
    super.initState();
    _nachhilfen = [];
    _getNachhilfen();
  }

  _getNachhilfen() {
    ServicesNachhilfe.getNachhilfe().then((nachhilfen) {
      setState(() {
        _nachhilfen = nachhilfen;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: GestureDetector(
        onTap: () => _getNachhilfen(),
        child: ListView.builder(
          itemBuilder: (cnx, index) {
            if (_nachhilfen[index].fach.startsWith('Mathe')) {
              colorCard = Colors.blue.shade300;
            } else if (_nachhilfen[index].fach.startsWith('Deutsch')) {
              colorCard = Colors.orange;
            } else if (_nachhilfen[index].fach.startsWith('Fran')) {
              colorCard = Colors.red;
            } else if (_nachhilfen[index].fach.startsWith('Englis')) {
              colorCard = Colors.yellow.shade600;
            } else if (_nachhilfen[index].fach.startsWith('Bio')) {
              colorCard = Colors.green.shade400;
            } else if (_nachhilfen[index].fach.startsWith('Chemie')) {
              colorCard = Colors.grey;
            } else if (_nachhilfen[index].fach.startsWith('Physik')) {
              colorCard = Colors.blue.shade100;
            }
            return GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) => buildPopupDialog(
                    context,
                    _nachhilfen[index].fach.toString(),
                    _nachhilfen[index].beschreibung.toString(),
                    ''),
              ),
              child: Card(
                color: colorCard,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: const Text('Mustermann, Max'
                                  //nachhilfen[index].account.toString(),
                                  //style: TextStyle(),
                                  ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                              child: Text(
                                _nachhilfen[index].fach.toString(),
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(
                            5,
                            5,
                            15,
                            0,
                          ),
                          padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54, width: 2),
                          ),
                          child: Column(
                            children: [
                              Container(
                                child: const Text('Jahrgang'),
                              ),
                              Text(
                                _nachhilfen[index].jahrgang.toString(),
                                style: const TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: Text(
                        _nachhilfen[index].beschreibung.toString(),
                        style: const TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: _nachhilfen.length,
        ),
      ),
    );
  }
}

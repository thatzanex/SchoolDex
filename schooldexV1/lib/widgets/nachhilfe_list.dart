import 'package:SchoolDex/db/nachhilfe_services.dart';
import 'package:flutter/material.dart';
import '../models/nachhilfe.dart';
import 'nachhilfe_update.dart';

class NachhilfeListe extends StatefulWidget {
  NachhilfeListe(this.nachhilfen);

  List<Nachhilfe> nachhilfen;
  @override
  State<NachhilfeListe> createState() => _NachhilfeListeState();
}

class _NachhilfeListeState extends State<NachhilfeListe> {
  Color colorCard = Colors.grey.shade200;
  _deleteNachhilfe(id) {
    ServicesNachhilfe.deleteNachhilfe(id).then((value) {
      ServicesNachhilfe.getNachhilfe().then((nachhilfen2) {
        setState(() {
          widget.nachhilfen = nachhilfen2;
        });
      });
    });
  }

  _updateNachhilfe(
      String id, String fach, String jahrgang, String beschreibung) {
    ServicesNachhilfe.updateNachhilfe(id, fach, jahrgang, beschreibung)
        .then((value) {
      ServicesNachhilfe.getNachhilfe().then((nachhilfen1) {
        setState(() {
          widget.nachhilfen = nachhilfen1;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: ListView.builder(
        itemBuilder: (cnx, index) {
          if (widget.nachhilfen[index].fach.startsWith('Mathe')) {
            colorCard = Colors.blue.shade300;
          } else if (widget.nachhilfen[index].fach.startsWith('Deutsch')) {
            colorCard = Colors.orange;
          } else if (widget.nachhilfen[index].fach.startsWith('Fran')) {
            colorCard = Colors.red;
          } else if (widget.nachhilfen[index].fach.startsWith('Englis')) {
            colorCard = Colors.yellow.shade600;
          } else if (widget.nachhilfen[index].fach.startsWith('Bio')) {
            colorCard = Colors.green.shade400;
          } else if (widget.nachhilfen[index].fach.startsWith('Chemie')) {
            colorCard = Colors.grey;
          } else if (widget.nachhilfen[index].fach.startsWith('Physik')) {
            colorCard = Colors.blue.shade100;
          }
          return GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) => buildPopupDialog(
                context,
                _updateNachhilfe,
                _deleteNachhilfe,
                widget.nachhilfen[index].id.toString(),
                widget.nachhilfen[index].fach.toString(),
                widget.nachhilfen[index].jahrgang.toString(),
                widget.nachhilfen[index].beschreibung.toString(),
              ),
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
                              widget.nachhilfen[index].fach.toString(),
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
                              widget.nachhilfen[index].jahrgang.toString(),
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
                      widget.nachhilfen[index].beschreibung.toString(),
                      style: const TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: widget.nachhilfen.length,
      ),
    );
  }
}

Widget buildPopupDialog(
  BuildContext context,
  Function _updateNachhilfe,
  Function _deleteNachhilfe,
  String id,
  String fach,
  String jahrgang,
  String beschreibung,
) {
  _startdeleteNachhilfe() {
    Navigator.of(context).pop();
    _deleteNachhilfe(id);
  }

  _startupdateNachhilfe(BuildContext cnx) {
    Navigator.of(context).pop();
    showModalBottomSheet(
      context: cnx,
      builder: (_) {
        return UpdateNachhilfe(
            _updateNachhilfe, id, fach, jahrgang, beschreibung);
      },
    );
  }

  return AlertDialog(
    title: Column(
      children: [
        Text(fach, style: const TextStyle(fontWeight: FontWeight.bold)),
        Container(
          child: Text('Jahrgang: ${jahrgang}'),
        ),
      ],
    ),
    content: Container(
      child: Text(beschreibung),
    ),
    actions: [
      Row(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 20, 0),
            child: IconButton(
                onPressed: () => _startupdateNachhilfe(context),
                icon: Icon(
                  Icons.change_circle_outlined,
                  color: Colors.blue,
                )),
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close),
            label: const Text('Schließen'),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
            child: IconButton(
                onPressed: () => _startdeleteNachhilfe(),
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.blue,
                )),
          )
        ],
      ),
    ],
  );
}

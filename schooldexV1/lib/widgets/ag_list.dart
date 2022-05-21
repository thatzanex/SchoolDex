import 'package:SchoolDex/db/ag_services.dart';
import 'package:flutter/material.dart';
import '../models/ag.dart';
import 'ag_update.dart';

class AGliste extends StatefulWidget {
  AGliste(this.agangebot, this.schulname);

  List<AGs> agangebot;
  String schulname;

  @override
  State<AGliste> createState() => _AGlisteState();
}

class _AGlisteState extends State<AGliste> {
  _deleteAgs(id) {
    ServicesAgs.deleteAgs(id).then((value) {
      ServicesAgs.getAgs(widget.schulname).then((ags2) {
        setState(() {
          widget.agangebot = ags2;
        });
      });
    });
  }

  _updateAGs(String id, String thema, String jahrgang, String beschreibung,
      String termin, String schulname) {
    ServicesAgs.updateAgs(id, thema, jahrgang, beschreibung, termin, schulname)
        .then((value) {
      ServicesAgs.getAgs(schulname).then((ags1) {
        setState(() {
          widget.agangebot = ags1;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: GestureDetector(
        onTap: () => print(widget.agangebot),
        child: ListView.builder(
          itemBuilder: (cnx, index) {
            return GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) => buildPopupDialog(
                  context,
                  _updateAGs,
                  _deleteAgs,
                  widget.agangebot[index].id.toString(),
                  widget.agangebot[index].thema.toString(),
                  widget.agangebot[index].jahrgang.toString(),
                  widget.agangebot[index].beschreibung.toString(),
                  widget.agangebot[index].termin.toString(),
                  widget.agangebot[index].schulname.toString(),
                ),
              ),
              child: Card(
                //color: agangebot[index].colorcard,
                color: Colors.orange,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                              child: Text(
                                widget.agangebot[index].thema.toString(),
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Text(
                                widget.agangebot[index].termin.toString(),
                                //style: TextStyle(),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.all(5),
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
                                widget.agangebot[index].jahrgang.toString(),
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
                        widget.agangebot[index].beschreibung.toString(),
                        style: const TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: widget.agangebot.length,
        ),
      ),
    );
  }
}

Widget buildPopupDialog(
    BuildContext context,
    Function updateAgs,
    Function deleteAgs,
    String id,
    String thema,
    String jahrgang,
    String beschreibung,
    String termin,
    String schulname) {
  _startdeleteAgs() {
    Navigator.of(context).pop();
    deleteAgs(id);
  }

  _startupdateAgs(BuildContext cnx) {
    Navigator.of(context).pop();
    showModalBottomSheet(
      context: cnx,
      builder: (_) {
        return UpdateAGs(
            updateAgs, id, thema, jahrgang, beschreibung, termin, schulname);
      },
    );
  }

  return AlertDialog(
    title: Column(
      children: [
        Text(thema, style: const TextStyle(fontWeight: FontWeight.bold)),
        Container(
          child: termin.isEmpty
              ? Container()
              : Text(termin, style: const TextStyle(fontSize: 15)),
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
                onPressed: () => _startupdateAgs(context),
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
                onPressed: () => _startdeleteAgs(),
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

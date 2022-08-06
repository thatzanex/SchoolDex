import 'package:schooldex/db/local_db/nachhilfe_local.dart';
import 'package:schooldex/db/nachhilfe_services.dart';
import 'package:flutter/material.dart';
import '/models/nachhilfe.dart';
import 'nachhilfe_update.dart';
import '../popup.dart';

class NachhilfeListe extends StatefulWidget {
  final String schulname;
  final String isTeacher;
  final String userId;
  NachhilfeListe(this.nachhilfen, this.schulname, this.isTeacher, this.userId,
      {Key? key})
      : super(key: key);

  List<Nachhilfe> nachhilfen;
  @override
  State<NachhilfeListe> createState() => _NachhilfeListeState();
}

class _NachhilfeListeState extends State<NachhilfeListe> {
  Color colorCard = Colors.grey.shade200;
  _deleteNachhilfe(id) {
    NachhilfeLocalServices.instance.remove(id).then((value) {
      NachhilfeLocalServices.instance.getAccount().then((nachhilfen2) {
        setState(() {
          widget.nachhilfen = nachhilfen2;
        });
      });
    });
  }

  _updateNachhilfe(String id, String fach, String jahrgang, String beschreibung,
      String userId, String username, String schulname) {
    NachhilfeLocalServices.instance
        .update(Nachhilfe(
            id: id,
            fach: fach,
            jahrgang: jahrgang,
            beschreibung: beschreibung,
            userId: userId,
            username: username,
            schulname: schulname))
        .then((value) {
      NachhilfeLocalServices.instance.getAccount().then((nachhilfen1) {
        setState(() {
          widget.nachhilfen = nachhilfen1;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (cnx, index) {
        if (widget.nachhilfen[index].fach.startsWith('Mathe')) {
          colorCard = Color(0xFFA0C4FF);
        } else if (widget.nachhilfen[index].fach.startsWith('Deutsch')) {
          colorCard = Color(0xFFFD9E9E);
        } else if (widget.nachhilfen[index].fach.startsWith('Fran')) {
          colorCard = Color(0xFF86e7b8);
        } else if (widget.nachhilfen[index].fach.startsWith('Englisch')) {
          colorCard = Color(0xFFFAE38A);
        } else if (widget.nachhilfen[index].fach.startsWith('Bio')) {
          colorCard = Color(0xFF91F5AD); //91F5AD; 93ff96
        } else if (widget.nachhilfen[index].fach.startsWith('Chemie')) {
          colorCard = Color(0xFF9BF6FF);
        } else if (widget.nachhilfen[index].fach.startsWith('Physik')) {
          colorCard = Color(0xFFBDB2FF);
        } else if (widget.nachhilfen[index].fach.startsWith('Geschi')) {
          colorCard = Color(0xFFFDCC90);
        }
        return GestureDetector(
          onTap: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              if ( //widget.isTeacher.startsWith('L135') ||
                  widget.userId == widget.nachhilfen[index].userId ||
                      widget.isTeacher.startsWith('Admin789')) {
                return buildPopupDialog(
                  context,
                  _updateNachhilfe,
                  _deleteNachhilfe,
                  widget.nachhilfen[index].id.toString(),
                  widget.nachhilfen[index].fach.toString(),
                  widget.nachhilfen[index].jahrgang.toString(),
                  widget.nachhilfen[index].beschreibung.toString(),
                  widget.nachhilfen[index].userId.toString(),
                  widget.nachhilfen[index].username.toString(),
                  widget.nachhilfen[index].schulname.toString(),
                );
              } else {
                return schuelerPopupDialog(
                    context,
                    widget.nachhilfen[index].fach.toString(),
                    widget.nachhilfen[index].beschreibung.toString(),
                    widget.nachhilfen[index].jahrgang.toString());
              }
            },
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
                          child: Text(
                            widget.nachhilfen[index].username.toString(),
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
                          const Text('Jahrgang'),
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
    );
  }
}

Widget buildPopupDialog(
    BuildContext context,
    Function updateNachhilfe,
    Function deleteNachhilfe,
    String id,
    String fach,
    String jahrgang,
    String beschreibung,
    String userid,
    String username,
    String schulname) {
  _startdeleteNachhilfe() {
    Navigator.of(context).pop();
    deleteNachhilfe(id);
  }

  _startupdateNachhilfe(BuildContext cnx) {
    Navigator.of(context).pop();
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return DraggableScrollableSheet(
            maxChildSize: 0.88,
            initialChildSize: 0.88,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                  controller: scrollController,
                  child: UpdateNachhilfe(updateNachhilfe, id, fach, jahrgang,
                      beschreibung, userid, username, schulname));
            });
      },
    );
  }

  return AlertDialog(
    title: Column(
      children: [
        Text(fach, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text('Jahrgang: $jahrgang'),
      ],
    ),
    content: Text(beschreibung),
    actions: [
      Row(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 20, 0),
            child: IconButton(
                onPressed: () => _startupdateNachhilfe(context),
                icon: const Icon(
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
            padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
            child: IconButton(
                onPressed: () => _startdeleteNachhilfe(),
                icon: const Icon(
                  Icons.delete_outline,
                  color: Colors.blue,
                )),
          )
        ],
      ),
    ],
  );
}

import 'package:schooldex/db/blackboard_services.dart';
import 'package:flutter/material.dart';
import '../models/blackboard.dart';
import 'blackboard_update.dart';
import 'popup.dart';

class BlackboardListe extends StatefulWidget {
  final String schulname;
  final String isTeacher;
  final String userId;
  BlackboardListe(this.blackboards, this.schulname, this.isTeacher, this.userId,
      {Key? key})
      : super(key: key);

  List<Blackboard> blackboards;
  @override
  State<BlackboardListe> createState() => _BlackboardListeState();
}

class _BlackboardListeState extends State<BlackboardListe> {
  Color colorCard = Colors.grey.shade200;
  _deleteBlackboard(id) {
    ServicesBlackboard.deleteBlackboard(id, widget.schulname).then((value) {
      ServicesBlackboard.getBlackboard(widget.schulname).then((blackboard2) {
        setState(() {
          widget.blackboards = blackboard2;
        });
      });
    });
  }

  _updateBlackboard(
      String id,
      String ueberschrift,
      String beschreibung,
      String color,
      String datum,
      String userId,
      String username,
      String schulname) {
    ServicesBlackboard.updateBlackboard(id, ueberschrift, beschreibung, color,
            datum, userId, username, schulname)
        .then((value) {
      ServicesBlackboard.getBlackboard(schulname).then((blackboard1) {
        setState(() {
          widget.blackboards = blackboard1;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (cnx, index) {
        if (widget.blackboards[index].color.toString() == '1') {
          colorCard = Colors.red;
        } else if (widget.blackboards[index].color.toString() == '2') {
          colorCard = Colors.green.shade400;
        } else if (widget.blackboards[index].color.toString() == '3') {
          colorCard = Colors.blue.shade300;
        } else if (widget.blackboards[index].color.toString() == '4') {
          colorCard = Colors.yellow.shade600;
        } else if (widget.blackboards[index].color.toString() == '5') {
          colorCard = Colors.orange;
        }
        return GestureDetector(
          onTap: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              if ( //widget.isTeacher.startsWith('L135') ||
                  widget.userId == widget.blackboards[index].userId ||
                      widget.isTeacher.startsWith('Admin789')) {
                return buildPopupDialog(
                  context,
                  _updateBlackboard,
                  _deleteBlackboard,
                  widget.blackboards[index].id.toString(),
                  widget.blackboards[index].ueberschrift.toString(),
                  widget.blackboards[index].beschreibung.toString(),
                  widget.blackboards[index].color.toString(),
                  widget.blackboards[index].datum.toString(),
                  widget.blackboards[index].userId.toString(),
                  widget.blackboards[index].username.toString(),
                  widget.blackboards[index].schulname.toString(),
                );
              } else {
                return schuelerPopupDialog(
                  context,
                  widget.blackboards[index].ueberschrift.toString(),
                  widget.blackboards[index].beschreibung.toString(),
                  widget.blackboards[index].datum.toString(),
                );
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
                            widget.blackboards[index].username.toString(),
                            //style: TextStyle(),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                          child: Text(
                            widget.blackboards[index].ueberschrift.toString(),
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  child: Text(
                    widget.blackboards[index].beschreibung.toString(),
                    style: const TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: widget.blackboards.length,
    );
  }
}

Widget buildPopupDialog(
    BuildContext context,
    Function updateBlackboard,
    Function deleteBlackboard,
    String id,
    String ueberschrift,
    String beschreibung,
    String color,
    String datum,
    String userid,
    String username,
    String schulname) {
  _startdeleteBlackboard() {
    Navigator.of(context).pop();
    deleteBlackboard(id);
  }

  _startupdateBlackboard(BuildContext cnx) {
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
                  child: UpdateBlackboard(updateBlackboard, id, ueberschrift,
                      beschreibung, color, userid, username, schulname));
            });
      },
    );
  }

  return AlertDialog(
    title: Column(
      children: [
        Text(ueberschrift, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(datum),
      ],
    ),
    content: Text(beschreibung),
    actions: [
      Row(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 20, 0),
            child: IconButton(
                onPressed: () => _startupdateBlackboard(context),
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
                onPressed: () => _startdeleteBlackboard(),
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

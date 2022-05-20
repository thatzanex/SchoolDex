import 'package:flutter/material.dart';

Widget SchuelerPopupDialog(
    BuildContext context, String ueberschrift, String inhalt, String datum) {
  return AlertDialog(
    title: Column(
      children: [
        Text(ueberschrift, style: const TextStyle(fontWeight: FontWeight.bold)),
        Container(
          child: datum.isEmpty
              ? Container()
              : Text(datum, style: const TextStyle(fontSize: 15)),
        ),
      ],
    ),
    content: Container(
      child: Text(inhalt),
    ),
    actions: [
      Row(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 20, 0),
            child: IconButton(
                onPressed: () {},
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
                onPressed: () {},
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

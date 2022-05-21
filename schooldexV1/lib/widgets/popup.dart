import 'package:flutter/material.dart';

Widget schuelerPopupDialog(
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
    content: Text(inhalt),
    actions: [
      Center(
        child: TextButton.icon(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close),
          label: const Text('Schließen'),
        ),
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import '../models/nachhilfe.dart';
import 'popup.dart';

class NachhilfeListe extends StatelessWidget {
  NachhilfeListe(this.nachhilfen);

  final List<Nachhilfe> nachhilfen;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: ListView.builder(
        itemBuilder: (cnx, index) {
          return GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) => buildPopupDialog(
                  context,
                  nachhilfen[index].fach.toString(),
                  nachhilfen[index].beschreibung.toString(),
                  ''),
            ),
            child: Card(
              color: nachhilfen[index].colorcard,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(),
                          Container(
                            margin: const EdgeInsets.fromLTRB(25, 20, 0, 0),
                            child: Text(
                              nachhilfen[index].fach.toString(),
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
                          5,
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
                              nachhilfen[index].jahrgang.toString(),
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
                      nachhilfen[index].beschreibung.toString(),
                      style: const TextStyle(fontSize: 17, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: nachhilfen.length,
      ),
    );
  }
}

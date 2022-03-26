import 'package:flutter/material.dart';
import '../models/nachhilfe.dart';

class NachhilfeListe extends StatelessWidget {
  NachhilfeListe(this.nachhilfen);

  final List<Nachhilfe> nachhilfen;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: ListView.builder(
        itemBuilder: (cnx, index) {
          return Card(
            color: nachhilfen[index].colorcard,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        nachhilfen[index].fach.toString(),
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54, width: 2),
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: Text('Jahrgang'),
                          ),
                          Text(
                            nachhilfen[index].jahrgang.toString(),
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text(
                    nachhilfen[index].beschreibung.toString(),
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: nachhilfen.length,
      ),
    );
  }
}

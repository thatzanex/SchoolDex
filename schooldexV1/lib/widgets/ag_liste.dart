import 'package:flutter/material.dart';
import '../models/ag.dart';

class AGliste extends StatelessWidget {
  AGliste(this.agangebot);

  final List<AGs> agangebot;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: ListView.builder(
        itemBuilder: (cnx, index) {
          return Card(
            //color: agangebot[index].colorcard,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                          child: Text(
                            agangebot[index].thema.toString(),
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Text(
                            agangebot[index].termin.toString(),
                            //style: TextStyle(),
                          ),
                        ),
                      ],
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
                            agangebot[index].jahrgang.toString(),
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
                    agangebot[index].beschreibung.toString(),
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: agangebot.length,
      ),
    );
  }
}

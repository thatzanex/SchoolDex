//import 'package:flutter/material.dart';

class News {
  String ueberschrift;
  //Bild
  String inhalt;
  String? datum;

  News({
    required this.ueberschrift,
    //required this. Bild,
    required this.inhalt,
    this.datum,
  });
}

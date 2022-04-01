import 'package:flutter/material.dart';

class Nachhilfe {
  String fach;
  String jahrgang;
  String? beschreibung;
  Color colorcard;

  Nachhilfe({
    required this.fach,
    required this.jahrgang,
    this.beschreibung,
    required this.colorcard,
  });
}

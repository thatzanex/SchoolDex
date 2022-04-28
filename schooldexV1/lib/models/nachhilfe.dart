class Nachhilfe {
  int? id;
  String fach;
  String jahrgang;
  String? beschreibung;
  int colorcard;

  Nachhilfe({
    this.id,
    required this.fach,
    required this.jahrgang,
    this.beschreibung,
    required this.colorcard,
  });
}

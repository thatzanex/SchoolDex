class Nachhilfe {
  String? id;
  String fach;
  String jahrgang;
  String? beschreibung;

  Nachhilfe({
    this.id,
    required this.fach,
    required this.jahrgang,
    this.beschreibung,
  });

  factory Nachhilfe.fromMap(Map<String, dynamic> map) {
    return Nachhilfe(
      id: map['id'] as String,
      fach: map['fach'] as String,
      jahrgang: map['jahrgang'] as String,
      beschreibung: map['beschreibung'] as String,
    );
  }
}

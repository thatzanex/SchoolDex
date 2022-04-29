class Nachhilfe {
  int? id;
  String fach;
  String jahrgang;
  String? beschreibung;

  Nachhilfe({
    this.id,
    required this.fach,
    required this.jahrgang,
    this.beschreibung,
  });

  factory Nachhilfe.fromJson(Map<String, dynamic> json) {
    return Nachhilfe(
      id: json['id'] as int,
      fach: json['fach'] as String,
      jahrgang: json['jahrgang'] as String,
      beschreibung: json['beschreibung'] as String,
    );
  }
}

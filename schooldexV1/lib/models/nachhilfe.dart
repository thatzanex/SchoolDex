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

  factory Nachhilfe.fromJson(Map<String, dynamic> json) {
    return Nachhilfe(
      id: json['id'] as int,
      fach: json['fach'] as String,
      jahrgang: json['jahrgang'] as String,
      beschreibung: json['beschreibung'] as String,
      colorcard: json['colorcard'] as int,
    );
  }
}

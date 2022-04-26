import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fach': fach,
      'jahrgang': jahrgang,
      'beschreibung': beschreibung,
      'colorcard': colorcard,
    };
  }

  factory Nachhilfe.fromMap(Map<String, dynamic> map) {
    return Nachhilfe(
      id: map['id'],
      fach: map['fach'],
      jahrgang: map['jahrgang'],
      beschreibung: map['beschreibung'],
      colorcard: map['colorcard'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Nachhilfe.fromJson(String source) =>
      Nachhilfe.fromMap(json.decode(source));

  @override
  String toString() =>
      'Nachhilfe(id: $id, fach: $fach, jahrgang: $jahrgang, beschreibung: $beschreibung, colorcard: $colorcard)';
}

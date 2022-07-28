class Nachhilfe {
  String? id;
  String fach;
  String jahrgang;
  String? beschreibung;
  String userId;
  String username;
  String schulname;

  Nachhilfe(
      {this.id,
      required this.fach,
      required this.jahrgang,
      this.beschreibung,
      required this.userId,
      required this.username,
      required this.schulname});

  factory Nachhilfe.fromMap(Map<String, dynamic> map) {
    return Nachhilfe(
      id: map['id'] as String,
      fach: map['fach'] as String,
      jahrgang: map['jahrgang'] as String,
      beschreibung: map['beschreibung'] as String,
      userId: map['userId'] as String,
      username: map['benutzername'] as String,
      schulname: map['schulname'] as String,
    );
  }

  Map<String, dynamic> toMapLocal() {
    return {
      'id': id,
      'fach': fach,
      'jahrgang': jahrgang,
      'beschreibung': beschreibung,
      'userId': userId,
      'benutzername': username,
      'schulname': schulname,
    };
  }
}

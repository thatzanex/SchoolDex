class Blackboard {
  String? id;
  String ueberschrift;
  String beschreibung;
  String color;
  String datum;
  String userId;
  String username;
  String schulname;

  Blackboard(
      {this.id,
      required this.ueberschrift,
      required this.beschreibung,
      required this.color,
      required this.datum,
      required this.userId,
      required this.username,
      required this.schulname});

  factory Blackboard.fromMap(Map<String, dynamic> map) {
    return Blackboard(
      id: map['id'] as String,
      ueberschrift: map['ueberschrift'] as String,
      beschreibung: map['beschreibung'] as String,
      color: map['color'] as String,
      datum: map['datum'] as String,
      userId: map['userId'] as String,
      username: map['benutzername'] as String,
      schulname: map['schulname'] as String,
    );
  }
}

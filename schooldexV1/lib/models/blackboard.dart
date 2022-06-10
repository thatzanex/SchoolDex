class Blackboard {
  String? id;
  String ueberschrift;
  String? beschreibung;
  String userId;
  String username;
  String schulname;

  Blackboard(
      {this.id,
      required this.ueberschrift,
      this.beschreibung,
      required this.userId,
      required this.username,
      required this.schulname});

  factory Blackboard.fromMap(Map<String, dynamic> map) {
    return Blackboard(
      id: map['id'] as String,
      ueberschrift: map['ueberschrift'] as String,
      beschreibung: map['beschreibung'] as String,
      userId: map['userId'] as String,
      username: map['benutzername'] as String,
      schulname: map['schulname'] as String,
    );
  }
}

class News {
  String? id;
  String ueberschrift;
  //Bild
  String inhalt;
  String? datum;
  String schulname;
  String userId;

  News({
    this.id,
    required this.ueberschrift,
    //required this. Bild,
    required this.inhalt,
    this.datum,
    required this.schulname,
    required this.userId,
  });

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      id: map['id'] as String,
      ueberschrift: map['ueberschrift'] as String,
      inhalt: map['inhalt'] as String,
      datum: map['datum'] as String,
      schulname: map['schulname'] as String,
      userId: map['userId'] as String,
    );
  }

  Map<String, dynamic> toMapLocal() {
    return {
      'id': id,
      'ueberschrift': ueberschrift,
      'inhalt': inhalt,
      'datum': datum,
      'userId': userId,
      'schulname': schulname,
    };
  }
}

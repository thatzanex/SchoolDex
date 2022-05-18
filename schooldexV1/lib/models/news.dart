class News {
  String? id;
  String ueberschrift;
  //Bild
  String inhalt;
  String? datum;

  News({
    this.id,
    required this.ueberschrift,
    //required this. Bild,
    required this.inhalt,
    this.datum,
  });

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      id: map['id'] as String,
      ueberschrift: map['ueberschrift'] as String,
      inhalt: map['inhalt'] as String,
      datum: map['datum'] as String,
    );
  }
}

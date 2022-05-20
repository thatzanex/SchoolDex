class Account {
  String? id;
  String benutzername;
  String passwort;
  String? schulname;
  String status;

  Account({
    this.id,
    required this.benutzername,
    required this.passwort,
    this.schulname,
    required this.status,
  });

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'] as String,
      benutzername: map['benutzername'] as String,
      passwort: map['passwort'] as String,
      status: map['status'] as String,
    );
  }
}

import 'dart:convert';

class Account {
  String? id;
  String benutzername;
  String hash;
  String salt;
  String status;
  String schulname;

  Account({
    this.id,
    required this.benutzername,
    required this.hash,
    required this.salt,
    required this.schulname,
    required this.status,
  });

  String toJson() => json.encode(toMapLocal());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source));

  // String toStringLocal() =>
  //     'Account(id: $id, benutzername: $benutzername, passwort: $passwort, status: $status, schulname: $schulname )';

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'] as String,
      benutzername: map['benutzername'] as String,
      hash: map['hash'] as String,
      salt: map['salt'] as String,
      status: map['status1'] as String,
      schulname: map['schulname'] as String,
    );
  }

  factory Account.fromMapLocal(Map<String, dynamic> map) {
    return Account(
      id: map['id'] as String,
      benutzername: map['benutzername'] as String,
      hash: map['hash'] as String,
      salt: map['salt'] as String,
      status: map['status'] as String,
      schulname: map['schulname'] as String,
    );
  }

  Map<String, dynamic> toMapLocal() {
    return {
      'id': id,
      'benutzername': benutzername,
      'hash': hash,
      'salt': salt,
      'status': status,
      'schulname': schulname,
    };
  }
}

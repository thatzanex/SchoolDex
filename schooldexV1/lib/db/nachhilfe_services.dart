import 'dart:convert';
import 'package:http/http.dart' as http;
import '/models/nachhilfe.dart';

class ServicesNachhilfe {
  static final Uri root =
      Uri.http('schooldex.gehronlein.de', '/SchoolDexDB/nachhilfe_actions.php');
  static const getAllAction = 'GET_ALL';
  static const String creatTable = 'CREATE_TABLE';
  static const String addNachhilfeAction = 'ADD_Nachhilfe';
  static const String updateNachhilfeAction = 'UPDATE_Nachhilfe';
  static const String deleteNachhilfeAction = 'DELETE_Nachhilfe';

  static Future<List<Nachhilfe>> getNachhilfe(String schulname) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = getAllAction;
      map['schulname'] = schulname;
      final response = await http.post(root, body: map);
      if (200 == response.statusCode) {
        var resultsObjsJson = jsonDecode(response.body) as List;
        List<Nachhilfe> listchen1 =
            resultsObjsJson.map((e) => Nachhilfe.fromMap(e)).toList();
        return listchen1;
      } else {
        return <Nachhilfe>[];
      }
    } catch (e) {
      return <Nachhilfe>[];
    }
  }

  static Future<String> createTable(String schulname) async {
    try {
      var map = Map<String, dynamic>();
      map["action"] = creatTable;
      map["schulname"] = schulname;
      final response = await http.post(root, body: map);
      return response.body;
    } catch (e) {
      return 'error';
    }
  }

  static Future<String> addNachhilfe(
      String fach,
      String jahrgang,
      String beschreibung,
      String userId,
      String username,
      String schulname) async {
    try {
      var map = Map<String, dynamic>();
      map["action"] = addNachhilfeAction;
      map["fach"] = fach;
      map["jahrgang"] = jahrgang;
      map["beschreibung"] = beschreibung;
      map["userId"] = userId;
      map["benutzername"] = username;
      map["schulname"] = schulname;
      final response = await http.post(root, body: map);
      return response.body;
    } catch (e) {
      return 'error';
    }
  }

  static Future<String> updateNachhilfe(
      String id,
      String fach,
      String jahrgang,
      String beschreibung,
      String userId,
      String username,
      String schulname) async {
    try {
      var map = Map<String, dynamic>();
      map["action"] = updateNachhilfeAction;
      map["id"] = id;
      map["fach"] = fach;
      map["jahrgang"] = jahrgang;
      map["beschreibung"] = beschreibung;
      map["userId"] = userId;
      map["benutzername"] = username;
      map["schulname"] = schulname;
      final response = await http.post(root, body: map);
      return response.body;
    } catch (e) {
      return 'error';
    }
  }

  static Future<String> deleteNachhilfe(String id, String schulname) async {
    try {
      var map = Map<String, dynamic>();
      map["action"] = deleteNachhilfeAction;
      map["id"] = id;
      map["schulname"] = schulname;
      final response = await http.post(root, body: map);
      return response.body;
    } catch (e) {
      return 'error';
    }
  }
}

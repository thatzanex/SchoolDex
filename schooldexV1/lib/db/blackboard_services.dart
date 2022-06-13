import 'dart:convert';
import 'package:http/http.dart' as http;
import '/models/blackboard.dart';

class ServicesBlackboard {
  static final Uri root = Uri.https(
      'schooldex.gehronlein.de', '/SchoolDexDB/blackboard_actions.php');
  static const getAllAction = 'GET_ALL';
  static const String creatTable = 'CREATE_TABLE';
  static const String addBlackboardAction = 'ADD_blackboard';
  static const String updateBlackboardAction = 'UPDATE_blackboard';
  static const String deleteBlackboardAction = 'DELETE_blackboard';

  static Future<List<Blackboard>> getBlackboard(String schulname) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = getAllAction;
      map['schulname'] = schulname;
      final response = await http.post(root, body: map);
      if (200 == response.statusCode) {
        var resultsObjsJson = jsonDecode(response.body) as List;
        List<Blackboard> listchen1 =
            resultsObjsJson.map((e) => Blackboard.fromMap(e)).toList();
        return listchen1;
      } else {
        return <Blackboard>[];
      }
    } catch (e) {
      return <Blackboard>[];
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

  static Future<String> addBlackboard(
      String ueberschrift,
      String beschreibung,
      String color,
      String datum,
      String userId,
      String username,
      String schulname) async {
    try {
      var map = Map<String, dynamic>();
      map["action"] = addBlackboardAction;
      map["ueberschrift"] = ueberschrift;
      map["beschreibung"] = beschreibung;
      map["color"] = color;
      map["datum"] = datum;
      map["userId"] = userId;
      map["benutzername"] = username;
      map["schulname"] = schulname;
      final response = await http.post(root, body: map);
      return response.body;
    } catch (e) {
      return 'error';
    }
  }

  static Future<String> updateBlackboard(
      String id,
      String ueberschrift,
      String beschreibung,
      String color,
      String datum,
      String userId,
      String username,
      String schulname) async {
    try {
      var map = Map<String, dynamic>();
      map["action"] = updateBlackboardAction;
      map["id"] = id;
      map["ueberschrift"] = ueberschrift;
      map["beschreibung"] = beschreibung;
      map["color"] = color;
      map["datum"] = datum;
      map["userId"] = userId;
      map["benutzername"] = username;
      map["schulname"] = schulname;
      final response = await http.post(root, body: map);
      return response.body;
    } catch (e) {
      return 'error';
    }
  }

  static Future<String> deleteBlackboard(String id, String schulname) async {
    try {
      var map = Map<String, dynamic>();
      map["action"] = deleteBlackboardAction;
      map["id"] = id;
      map["schulname"] = schulname;
      final response = await http.post(root, body: map);
      return response.body;
    } catch (e) {
      return 'error';
    }
  }
}

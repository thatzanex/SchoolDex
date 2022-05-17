import 'dart:convert';
import 'package:http/http.dart' as http;
import '/models/nachhilfe.dart';

class ServicesNachhilfe {
  static final Uri ROOT =
      Uri.http('localhost', '/SchoolDexDB/nachhilfe_actions.php');
  static const _GET_ALL_ACTION = 'GET_ALL';
  static const String _ADD_Nachhilfe_ACTION = 'ADD_Nachhilfe';
  static const String _UPDATE_Nachhilfe_ACTION = 'UPDATE_Nachhilfe';
  static const String _DELETE_Nachhilfe_ACTION = 'DELETE_Nachhilfe';

  static Future<List<Nachhilfe>> getNachhilfe() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      final response = await http.post(ROOT, body: map);
      print('getNachhilfe Response: ${response.body}');
      if (200 == response.statusCode) {
        var resultsObjsJson = jsonDecode(response.body) as List;
        List<Nachhilfe> listchen1 =
            resultsObjsJson.map((e) => Nachhilfe.fromMap(e)).toList();
        print(listchen1);
        return listchen1;
      } else {
        return <Nachhilfe>[];
      }
    } catch (e) {
      return <Nachhilfe>[];
    }
  }

  static Future<String> addNachhilfe(
    String fach,
    String jahrgang,
    String beschreibung,
  ) async {
    try {
      var map = Map<String, dynamic>();
      map["action"] = _ADD_Nachhilfe_ACTION;
      map["fach"] = fach;
      map["jahrgang"] = jahrgang;
      map["beschreibung"] = beschreibung;
      final response = await http.post(ROOT, body: map);
      print("addNachhilfe >> Response:: ${response.body}");
      return response.body;
    } catch (e) {
      return 'error';
    }
  }

  static Future<String> updateNachhilfe(
      int id, String fach, String jahrgang, String beschreibung) async {
    try {
      var map = Map<String, dynamic>();
      map["action"] = _UPDATE_Nachhilfe_ACTION;
      map["id"] = id;
      map["fach"] = fach;
      map["jahrgang"] = jahrgang;
      map["beschreibung"] = beschreibung;
      final response = await http.post(ROOT, body: map);
      print("updateNachhilfe >> Response:: ${response.body}");
      return response.body;
    } catch (e) {
      return 'error';
    }
  }

  static Future<String> deleteNachhilfe(String id) async {
    try {
      var map = Map<String, dynamic>();
      map["action"] = _DELETE_Nachhilfe_ACTION;
      map["id"] = id;
      final response = await http.post(ROOT, body: map);
      print("deleteNachhilfe >> Response:: ${response.body}");
      return response.body;
    } catch (e) {
      return 'error';
    }
  }
}

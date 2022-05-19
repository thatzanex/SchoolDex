import 'dart:convert';
import 'package:http/http.dart' as http;
import '/models/ag.dart';

class ServicesAgs {
  static final Uri ROOT = Uri.http('localhost', '/SchoolDexDB/ag_actions.php');
  static const _GET_ALL_ACTION = 'GET_ALL';
  static const String _ADD_Ags_ACTION = 'ADD_Ags';
  static const String _UPDATE_Ags_ACTION = 'UPDATE_Ags';
  static const String _DELETE_Ags_ACTION = 'DELETE_Ags';

  static Future<List<AGs>> getAgs() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      final response = await http.post(ROOT, body: map);
      //print('getAgs Response: ${response.body}');
      if (200 == response.statusCode) {
        var resultsObjsJson = jsonDecode(response.body) as List;
        List<AGs> listchen1 =
            resultsObjsJson.map((e) => AGs.fromMap(e)).toList();
        //print(listchen1);
        return listchen1;
      } else {
        return <AGs>[];
      }
    } catch (e) {
      return <AGs>[];
    }
  }

  static Future<String> addAgs(
    String thema,
    String jahrgang,
    String beschreibung,
    String termin,
  ) async {
    try {
      var map = Map<String, dynamic>();
      map["action"] = _ADD_Ags_ACTION;
      map["thema"] = thema;
      map["jahrgang"] = jahrgang;
      map["beschreibung"] = beschreibung;
      map["termin"] = termin;
      final response = await http.post(ROOT, body: map);
      print("addAgs >> Response:: ${response.body}");
      return response.body;
    } catch (e) {
      return 'error';
    }
  }

  static Future<String> updateAgs(String id, String thema, String jahrgang,
      String beschreibung, String termin) async {
    try {
      var map = Map<String, dynamic>();
      map["action"] = _UPDATE_Ags_ACTION;
      map["id"] = id;
      map["thema"] = thema;
      map["jahrgang"] = jahrgang;
      map["beschreibung"] = beschreibung;
      map["termin"] = termin;
      final response = await http.post(ROOT, body: map);
      print("updateAgs >> Response:: ${response.body}");
      return response.body;
    } catch (e) {
      return 'error';
    }
  }

  static Future<String> deleteAgs(String id) async {
    try {
      var map = Map<String, dynamic>();
      map["action"] = _DELETE_Ags_ACTION;
      map["id"] = id;
      final response = await http.post(ROOT, body: map);
      print("deleteAGs >> Response:: ${response.body}");
      return response.body;
    } catch (e) {
      return 'error';
    }
  }
}

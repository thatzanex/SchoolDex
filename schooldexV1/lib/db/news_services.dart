import 'dart:convert';
import 'package:http/http.dart' as http;
import '/models/news.dart';

class ServicesNews {
  static final Uri root =
      Uri.http('localhost', '/SchoolDexDB/news_actions.php');
  static const _GET_ALL_ACTION = 'GET_ALL';
  static const String _ADD_News_ACTION = 'ADD_News';
  static const String _UPDATE_News_ACTION = 'UPDATE_News';
  static const String _DELETE_News_ACTION = 'DELETE_News';

  static Future<List<News>> getNews(String schulname) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      map['schulname'] = schulname;
      final response = await http.post(root, body: map);
      if (200 == response.statusCode) {
        var resultsObjsJson = jsonDecode(response.body) as List;
        List<News> listchen1 =
            resultsObjsJson.map((e) => News.fromMap(e)).toList();
        return listchen1;
      } else {
        return <News>[];
      }
    } catch (e) {
      return <News>[];
    }
  }

  static Future<String> addNews(String ueberschrift, String inhalt,
      String datum, String schulname) async {
    try {
      var map = Map<String, dynamic>();
      map["action"] = _ADD_News_ACTION;
      map["ueberschrift"] = ueberschrift;
      map["inhalt"] = inhalt;
      map["datum"] = datum;
      map["schulname"] = schulname;
      final response = await http.post(root, body: map);
      return response.body;
    } catch (e) {
      return 'error';
    }
  }

  static Future<String> updateNews(String id, String ueberschrift,
      String inhalt, String datum, String schulname) async {
    try {
      var map = Map<String, dynamic>();
      map["action"] = _UPDATE_News_ACTION;
      map["id"] = id;
      map["ueberschrift"] = ueberschrift;
      map["inhalt"] = inhalt;
      map["datum"] = datum;
      map["schulname"] = schulname;
      final response = await http.post(root, body: map);
      return response.body;
    } catch (e) {
      return 'error';
    }
  }

  static Future<String> deleteNews(String id, String schulname) async {
    try {
      var map = Map<String, dynamic>();
      map["action"] = _DELETE_News_ACTION;
      map["id"] = id;
      map["schulname"] = schulname;
      final response = await http.post(root, body: map);
      return response.body;
    } catch (e) {
      return 'error';
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import '/models/news.dart';

class ServicesNews {
  static final Uri root =
      Uri.http('localhost', '/SchoolDexDB/news_actions.php');
  static const getAllAction = 'GET_ALL';
  static const String creatTable = 'CREATE_TABLE';
  static const String addNewsAction = 'ADD_News';
  static const String updateNewsAction = 'UPDATE_News';
  static const String deleteNewsAction = 'DELETE_News';

  static Future<List<News>> getNews(String schulname) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = getAllAction;
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

  static Future<String> addNews(String ueberschrift, String inhalt,
      String datum, String schulname, String userId) async {
    try {
      var map = Map<String, dynamic>();
      map["action"] = addNewsAction;
      map["ueberschrift"] = ueberschrift;
      map["inhalt"] = inhalt;
      map["datum"] = datum;
      map["schulname"] = schulname;
      map["userId"] = userId;
      final response = await http.post(root, body: map);
      return response.body;
    } catch (e) {
      return 'error';
    }
  }

  static Future<String> updateNews(String id, String ueberschrift,
      String inhalt, String datum, String schulname, String userId) async {
    try {
      var map = Map<String, dynamic>();
      map["action"] = updateNewsAction;
      map["id"] = id;
      map["ueberschrift"] = ueberschrift;
      map["inhalt"] = inhalt;
      map["datum"] = datum;
      map["schulname"] = schulname;
      map["userId"] = userId;
      final response = await http.post(root, body: map);
      return response.body;
    } catch (e) {
      return 'error';
    }
  }

  static Future<String> deleteNews(String id, String schulname) async {
    try {
      var map = Map<String, dynamic>();
      map["action"] = deleteNewsAction;
      map["id"] = id;
      map["schulname"] = schulname;
      final response = await http.post(root, body: map);
      return response.body;
    } catch (e) {
      return 'error';
    }
  }
}

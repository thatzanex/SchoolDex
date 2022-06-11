import 'dart:convert';
import 'package:http/http.dart' as http;
import '/models/account.dart';

class ServicesAccount {
  static final Uri root =
      Uri.http('localhost', '/SchoolDexDB/account_actions.php');
  static const String getAllAction = 'GET_ALL';
  static const String creatTables = 'CREATE_TABLE';
  static const String addAccountAction = 'ADD_Account';
  // static const String _UPDATE_Account_ACTION = 'UPDATE_Account';
  // static const String _DELETE_Account_ACTION = 'DELETE_Account';

  static Future<List<Account>> getAccount(String schulname) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = getAllAction;
      map['schulname'] = schulname;
      final response = await http.post(root, body: map);
      print(response.body);
      if (200 == response.statusCode) {
        var resultsObjsJson = jsonDecode(response.body) as List;
        List<Account> listchen1 =
            resultsObjsJson.map((e) => Account.fromMap(e)).toList();
        return listchen1;
      } else {
        return <Account>[];
      }
    } catch (e) {
      return <Account>[];
    }
  }

  static Future<String> createTable(String schulname) async {
    try {
      var map = Map<String, dynamic>();
      map["action"] = creatTables;
      map["schulname"] = schulname;
      final response = await http.post(root, body: map);
      print(map);
      print("createTable >> Response:: ${response.body}");
      return response.body;
    } catch (e) {
      return 'error';
    }
  }

  static Future<String> addAccount(
    String benutzername,
    String passwort,
    String schulname,
    String status,
  ) async {
    try {
      var map = Map<String, dynamic>();
      map["action"] = addAccountAction;
      map["benutzername"] = benutzername;
      map["passwort"] = passwort;
      map["schulname"] = schulname;
      map["status1"] = status;
      final response = await http.post(root, body: map);
      return response.body;
    } catch (e) {
      return 'error';
    }
  }

  // static Future<String> updateAccount(String id, String benutzername, String passwort,
  //     String schulcode, String status) async {
  //   try {
  //     var map = Map<String, dynamic>();
  //     map["action"] = _UPDATE_Account_ACTION;
  //     map["id"] = id;
  //     map["benutzername"] = benutzername;
  //     map["passwort"] = passwort;
  //     map["schulcode"] = schulcode;
  //     map["status"] = status;
  //     final response = await http.post(ROOT, body: map);
  //     print("updateAccount >> Response:: ${response.body}");
  //     return response.body;
  //   } catch (e) {
  //     return 'error';
  //   }
  // }

  // static Future<String> deleteAccount(String id) async {
  //   try {
  //     var map = Map<String, dynamic>();
  //     map["action"] = _DELETE_Account_ACTION;
  //     map["id"] = id;
  //     final response = await http.post(ROOT, body: map);
  //     print("deleteAccount >> Response:: ${response.body}");
  //     return response.body;
  //   } catch (e) {
  //     return 'error';
  //   }
  // }
}

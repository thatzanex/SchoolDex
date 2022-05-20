import 'dart:convert';
import 'package:http/http.dart' as http;
import '/models/account.dart';

class ServicesAccount {
  static final Uri ROOT =
      Uri.http('localhost', '/SchoolDexDB/account_actions.php');
  static const _GET_ALL_ACTION = 'GET_ALL';
  static const String _ADD_Account_ACTION = 'ADD_Account';
  // static const String _UPDATE_Account_ACTION = 'UPDATE_Account';
  // static const String _DELETE_Account_ACTION = 'DELETE_Account';

  static Future<List<Account>> getAccount(String schulname) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      map['schulname'] = schulname;
      final response = await http.post(ROOT, body: map);
      print('getAccount Response: ${response.body}');
      if (200 == response.statusCode) {
        var resultsObjsJson = jsonDecode(response.body) as List;
        List<Account> listchen1 =
            resultsObjsJson.map((e) => Account.fromMap(e)).toList();
        //print(listchen1);
        return listchen1;
      } else {
        return <Account>[];
      }
    } catch (e) {
      return <Account>[];
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
      map["action"] = _ADD_Account_ACTION;
      map["benutzername"] = benutzername;
      map["passwort"] = passwort;
      map["schulname"] = schulname;
      map["status"] = status;
      final response = await http.post(ROOT, body: map);
      print("addAccount >> Response:: ${response.body}");
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

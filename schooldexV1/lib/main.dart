import 'package:flutter/material.dart';
import 'package:schooldex/models/blackboard.dart';
import 'package:schooldex/pages/search_page.dart';
import 'models/ag.dart';
import 'models/nachhilfe.dart';
import 'pages/ag_page.dart';
import 'pages/nachhilfe_page.dart';
import 'pages/vertretungs_page.dart';
import 'pages/news_page.dart';
import 'pages/settings_page.dart';
import 'pages/login_page.dart';
import 'pages/registrieren_page.dart';
import 'pages/blackboard_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String userId = '';
  String username = '';
  String dbname = '';
  String status1 = '';
  List<Nachhilfe> nachhilfeList = [];
  List<AGs> agList = [];
  List<Blackboard> blackboardlist = [];
  String ueberschrift = '';

  void accountStatus(
      String id, String benutzername, String schulname, String status) {
    userId = id;
    username = benutzername;
    dbname = schulname;
    status1 = status;
  }

  void searchItems(List<Nachhilfe> nachhilfen, List<AGs> ags,
      List<Blackboard> blackboards, String title) {
    nachhilfeList = nachhilfen;
    agList = ags;
    blackboardlist = blackboards;
    ueberschrift = title;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SchoolDex V1',
      home: RegistrierenPage(accountStatus),
      routes: {
        Nachhilfepage.routeName: (ctx) =>
            Nachhilfepage(status1, userId, username, dbname, searchItems),
        AGPage.routeName: (ctx) => AGPage(status1, dbname, userId, searchItems),
        Newspage.routeName: (ctx) => Newspage(status1, dbname, userId),
        Blackboardpage.routeName: (ctx) =>
            Blackboardpage(status1, userId, username, dbname, searchItems),
        Vertretungspage.routeName: (ctx) => const Vertretungspage(),
        Settingspage.routeName: (ctx) => Settingspage(username, dbname),
        LoginPage.routeName: (ctx) => LoginPage(accountStatus),
        RegistrierenPage.routeName: (ctx) => RegistrierenPage(accountStatus),
        Searchpage.routeName: (ctx) => Searchpage(nachhilfeList, agList,
            blackboardlist, ueberschrift, dbname, userId, status1),
      },
    );
  }
}

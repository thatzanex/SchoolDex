import 'package:flutter/material.dart';
import 'pages/ag_page.dart';
import 'pages/nachhilfe_page.dart';
import 'pages/vertretungs_page.dart';
import 'pages/news_page.dart';
import 'pages/settings_page.dart';
import 'pages/login_page.dart';
import 'pages/registrieren_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String userId = '';
  String username = '';
  String dbname = '';
  String status1 = '';

  void accountStatus(
      String id, String benutzername, String schulname, String status) {
    userId = id;
    username = benutzername;
    dbname = schulname;
    status1 = status;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SchoolDex V1',
      //home: Newspage(),
      home: RegistrierenPage(accountStatus),
      routes: {
        Nachhilfepage.routeName: (ctx) =>
            Nachhilfepage(status1, userId, username, dbname),
        AGPage.routeName: (ctx) => AGPage(status1, dbname),
        Newspage.routeName: (ctx) => Newspage(status1, dbname),
        Vertretungspage.routeName: (ctx) => Vertretungspage(),
        Settingspage.routeName: (ctx) => Settingspage(),
        LoginPage.routeName: (ctx) => LoginPage(accountStatus),
        RegistrierenPage.routeName: (ctx) => RegistrierenPage(accountStatus),
      },
    );
  }
}

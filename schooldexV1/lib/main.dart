import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mysql1/mysql1.dart';
import 'pages/ag_page.dart';
import 'pages/nachhilfe_page.dart';
import 'pages/mensa_page.dart';
import 'pages/news_page.dart';
import 'pages/account_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SchoolDex V1',
      home: Newspage(),
      routes: {
        Nachhilfepage.routeName: (ctx) => Nachhilfepage(),
        AGPage.routeName: (ctx) => AGPage(),
        Newspage.routeName: (ctx) => Newspage(),
        Mensapage.routeName: (ctx) => Mensapage(),
        Accountpage.routeName: (ctx) => Accountpage()
      },
    );
  }
}

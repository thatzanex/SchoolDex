import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/pages/account_page.dart';
import 'pages/ag_page.dart';
import 'pages/nachhilfe_page.dart';
import 'pages/mensa_page.dart';
import 'pages/news_page.dart';
import 'pages/account_page.dart';
import 'package:sqflite/sqflite.dart';

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
        '/nachhilfe': (ctx) => Nachhilfepage(),
        '/ags': (ctx) => AGPage(),
        '/news': (ctx) => Newspage(),
        '/mensa': (ctx) => Mensapage(),
        '/account': (ctx) => Accountpage()
      },
    );
  }
}

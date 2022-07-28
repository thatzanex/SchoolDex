import 'dart:io';
import 'package:flutter/material.dart';
import 'package:schooldex/pages/blackboard_page.dart';
import 'package:schooldex/pages/mensa_page.dart';
import '../pages/ag_page.dart';
import '../pages/vertretungs_page.dart';
import '../pages/nachhilfe_page.dart';
import '../pages/news_page.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final Color nachhilfeIconColor;
  final Color agIconColor;
  final Color newsIconColor;
  final Color vertretungsIconColor;
  final Color blackboardIconColor;
  final Color mensaIconColor;

  MyBottomNavigationBar(
    this.newsIconColor,
    this.nachhilfeIconColor,
    this.agIconColor,
    this.blackboardIconColor,
    this.vertretungsIconColor,
    this.mensaIconColor,
  );

  void selectPagetoNews(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(Newspage.routeName);
  }

  void selectPagetoNachhilfe(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(Nachhilfepage.routeName);
  }

  void selectPagetoAG(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(AGPage.routeName);
  }

  void selectPagetoVertretung(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(Vertretungspage.routeName);
  }

  void selectPagetoMensa(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(Mensapage.routeName);
  }

  void selectPagetoBlackboard(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(Blackboardpage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color.fromARGB(255, 29, 44, 89),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: Center(
          child: SizedBox(
            width: 360,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: Platform.isIOS
                      ? MediaQuery.of(context).size.width / 5 - 20
                      : MediaQuery.of(context).size.width / 5 - 30,
                  child: IconButton(
                    icon: const Icon(Icons.home_rounded),
                    color: newsIconColor,
                    iconSize: 40,
                    onPressed: () => selectPagetoNews(context),
                  ),
                ),
                SizedBox(
                  width: Platform.isIOS
                      ? MediaQuery.of(context).size.width / 5 - 15
                      : MediaQuery.of(context).size.width / 5 - 20,
                  child: IconButton(
                    icon: const Icon(Icons.school_rounded),
                    color: nachhilfeIconColor,
                    iconSize: 40,
                    onPressed: () => selectPagetoNachhilfe(context),
                  ),
                ),
                SizedBox(
                  width: Platform.isIOS
                      ? MediaQuery.of(context).size.width / 5 - 20
                      : MediaQuery.of(context).size.width / 5 - 20,
                  child: IconButton(
                    icon: const Icon(Icons.sports_basketball),
                    color: agIconColor,
                    iconSize: 40,
                    onPressed: () => selectPagetoAG(context),
                  ),
                ),
                SizedBox(
                  width: Platform.isIOS
                      ? MediaQuery.of(context).size.width / 5 - 15
                      : MediaQuery.of(context).size.width / 5 - 20,
                  child: IconButton(
                    icon: const Icon(Icons.backpack_outlined),
                    color: blackboardIconColor,
                    iconSize: 40,
                    onPressed: () => selectPagetoBlackboard(context),
                  ),
                ),
                SizedBox(
                  width: Platform.isIOS
                      ? MediaQuery.of(context).size.width / 5 - 20
                      : MediaQuery.of(context).size.width / 5 - 20,
                  child: IconButton(
                    icon: const Icon(Icons.table_chart_rounded),
                    color: vertretungsIconColor,
                    iconSize: 40,
                    onPressed: () => selectPagetoVertretung(context),
                  ),
                ),
                SizedBox(
                  width: Platform.isIOS
                      ? MediaQuery.of(context).size.width / 5 - 20
                      : MediaQuery.of(context).size.width / 5 - 30,
                  child: IconButton(
                    icon: const Icon(Icons.fastfood),
                    color: mensaIconColor,
                    iconSize: 39,
                    onPressed: () => selectPagetoMensa(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

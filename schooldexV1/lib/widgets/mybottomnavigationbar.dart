import 'package:flutter/material.dart';
import '../pages/ag_page.dart';
import '../pages/vertretungs_page.dart';
import '../pages/nachhilfe_page.dart';
import '../pages/news_page.dart';
import '../pages/account_page.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final Color nachhilfeIconColor;
  final Color agIconColor;
  final Color newsIconColor;
  final Color vertretungsIconColor;
  final Color settingsIconColor;

  MyBottomNavigationBar(this.newsIconColor, this.nachhilfeIconColor,
      this.agIconColor, this.vertretungsIconColor, this.settingsIconColor);

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

  void selectPagetoSettings(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(Settingspage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.blue,
      child: Container(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Container(
            width: 360,
            child: Row(
              children: <Widget>[
                Container(
                  width: 70,
                  child: IconButton(
                    icon: const Icon(Icons.home_rounded),
                    color: newsIconColor,
                    iconSize: 40,
                    onPressed: () => selectPagetoNews(context),
                  ),
                ),
                Container(
                  width: 70,
                  child: IconButton(
                    icon: const Icon(Icons.school_rounded),
                    color: nachhilfeIconColor,
                    iconSize: 40,
                    onPressed: () => selectPagetoNachhilfe(context),
                  ),
                ),
                Container(
                  width: 70,
                  child: IconButton(
                    icon: const Icon(Icons.sports_basketball),
                    color: agIconColor,
                    iconSize: 40,
                    onPressed: () => selectPagetoAG(context),
                  ),
                ),
                Container(
                  width: 70,
                  child: IconButton(
                    icon: const Icon(Icons.apps_outlined),
                    color: vertretungsIconColor,
                    iconSize: 40,
                    onPressed: () => selectPagetoVertretung(context),
                  ),
                ),
                Container(
                  width: 70,
                  child: IconButton(
                    icon: const Icon(Icons.settings),
                    color: settingsIconColor,
                    iconSize: 40,
                    onPressed: () => selectPagetoSettings(context),
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

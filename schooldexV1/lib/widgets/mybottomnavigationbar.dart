import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final Color nachhilfeIconColor;
  final Color agIconColor;
  final Color newsIconColor;
  final Color mensaIconColor;

  MyBottomNavigationBar(this.newsIconColor, this.nachhilfeIconColor,
      this.agIconColor, this.mensaIconColor);

  void selectPagetoNews(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed('/news');
  }

  void selectPagetoNachhilfe(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed('/nachhilfe');
  }

  void selectPagetoAG(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed('/ags');
  }

  void selectPagetoMensa(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed('/mensa');
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
                  width: 90,
                  child: IconButton(
                    icon: const Icon(Icons.home_rounded),
                    color: newsIconColor,
                    iconSize: 40,
                    onPressed: () => selectPagetoNews(context),
                  ),
                ),
                Container(
                  width: 90,
                  child: IconButton(
                    icon: const Icon(Icons.school_rounded),
                    color: nachhilfeIconColor,
                    iconSize: 40,
                    onPressed: () => selectPagetoNachhilfe(context),
                  ),
                ),
                Container(
                  width: 90,
                  child: IconButton(
                    icon: const Icon(Icons.table_chart_rounded),
                    color: agIconColor,
                    iconSize: 40,
                    onPressed: () => selectPagetoAG(context),
                  ),
                ),
                Container(
                  width: 90,
                  child: IconButton(
                    icon: const Icon(Icons.food_bank_rounded),
                    color: mensaIconColor,
                    iconSize: 40,
                    onPressed: () => selectPagetoMensa(context),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

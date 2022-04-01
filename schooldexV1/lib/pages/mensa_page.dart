import 'package:flutter/material.dart';
import '../widgets/MyBottomNavigationBar.dart';
import '../widgets/account_bottom.dart';

class Mensapage extends StatelessWidget {
  static const routeName = '/mensa';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Speiseplan'),
          actions: <Widget>[MyAccountbottom()],
        ),
        body: const Text('Speiseplan'),
        bottomNavigationBar: MyBottomNavigationBar(
            Colors.white, Colors.white, Colors.white, Colors.orange));
  }
}

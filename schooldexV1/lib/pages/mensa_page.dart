import 'package:flutter/material.dart';
import '../widgets/MyBottomNavigationBar.dart';
import '../widgets/account_bottom.dart';

class Mensapage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Speiseplan'),
          actions: <Widget>[MyAccountbottom()],
        ),
        body: Text('Der Speiseplan deiner Schule'),
        bottomNavigationBar: MyBottomNavigationBar(
            Colors.white, Colors.white, Colors.white, Colors.orange));
  }
}

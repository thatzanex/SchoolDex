import 'package:SchoolDex/widgets/mybottomnavigationbar.dart';
import 'package:flutter/material.dart';

class Settingspage extends StatelessWidget {
  static const routeName = '/settings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(5),
              child: const Icon(
                Icons.person,
                size: 150,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(Colors.white, Colors.white,
          Colors.white, Colors.white, Colors.orange),
    );
  }
}

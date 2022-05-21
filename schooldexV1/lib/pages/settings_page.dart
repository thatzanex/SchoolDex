import 'package:SchoolDex/pages/login_page.dart';
import 'package:SchoolDex/widgets/mybottomnavigationbar.dart';
import 'package:flutter/material.dart';
import '../db/local_services.dart';

class Settingspage extends StatelessWidget {
  static const routeName = '/settings';
  final String benutzername;
  final String schulname;
  Settingspage(this.benutzername, this.schulname);

  _loggout(context) {
    LocalServices.instance.getAccount().then((value) {
      String id = value[0].id.toString();
      LocalServices.instance.remove(id).then((value) =>
          Navigator.of(context).pushReplacementNamed(LoginPage.routeName));
    });
  }

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
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                'Benutzername: $benutzername',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                'Schule: $schulname',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextButton(
                  child: Text(
                    'Ausloggen',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    _loggout(context);
                  } //_loggout(context),
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

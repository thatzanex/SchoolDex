import 'package:schooldex/pages/login_page.dart';
import 'package:schooldex/pages/news_page.dart';
import 'package:schooldex/widgets/account_bottom.dart';
import 'package:schooldex/widgets/mybottomnavigationbar.dart';
import 'package:flutter/material.dart';
import '../db/local_services.dart';

class Settingspage extends StatelessWidget {
  static const routeName = '/settings';
  final String userId;
  final String benutzername;
  final String schulname;
  final String isTeacher;
  Settingspage(
    this.isTeacher,
    this.userId,
    this.benutzername,
    this.schulname,
  );

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
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 30,
          ),
          onPressed: () =>
              Navigator.of(context).pushReplacementNamed(Newspage.routeName),
        ),
        actions: [MyAccountbottom(color: Colors.orange)],
        title: const Text('Account'),
        backgroundColor: const Color.fromARGB(255, 29, 44, 89),
      ),
      body: Column(
        //mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              margin: const EdgeInsets.all(5),
              child: const Icon(
                Icons.person,
                size: 150,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: const Text(
              'Benutzername:',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 0, 20),
            child: Text(
              '   $benutzername',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: const Text(
              'Schule:',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 0, 20),
            child: Text(
              '   $schulname',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: const Text(
              'Status:',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text(
              isTeacher.startsWith('L135')
                  ? '   Lehrer'
                  : isTeacher.startsWith('Admin789')
                      ? '   Admin'
                      : '   Schüler',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Center(
              child: TextButton(
                  child: Text(
                    'Ausloggen',
                    style:
                        TextStyle(fontSize: 20, color: Colors.orange.shade700),
                  ),
                  onPressed: () {
                    _loggout(context);
                  }),
            ),
          )
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(
          Colors.white, Colors.white, Colors.white, Colors.white, Colors.white),
    );
  }
}

//import 'package:schooldex/db/accounts_services.dart';
import 'package:schooldex/pages/news_page.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:conduit_password_hash/conduit_password_hash.dart';
import 'registrieren_page.dart';
import '../db/local_db/account_local.dart';
import '../db/account_local_services.dart';
import '../models/account.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  final Function accountstatus;
  LoginPage(this.accountstatus);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final benutzernamenController = TextEditingController();
  final passwortController = TextEditingController();
  final schulController = TextEditingController();

  final _loginFocusNode = FocusNode();
  final _schulFocusNode = FocusNode();

  clarValues() {
    benutzernamenController.text = '';
    passwortController.text = '';
    schulController.text = '';
  }

  findAccounts() {
    //LocalServices.instance.remove('20');
    try {
      LocalServices.instance.getAccount().then((value) {
        try {
          widget.accountstatus(
              const Uuid().v1(),
              value[0].benutzername.toString(),
              value[0].schulname.toString(),
              value[0].status.toString());
          Navigator.of(context).pushReplacementNamed(Newspage.routeName);
        } catch (e) {
          return;
        }
      });
    } catch (e) {
      return;
    }
  }

  void submitData() {
    List<String> matchingList = [
      benutzernamenController.text,
    ];
    LocalServices.instance.getAccount().then((accountlist) {
      var index = accountlist
          .indexWhere((element) => matchingList.contains(element.benutzername));
      //var generator = accountlist[index].generator.toString();
      PBKDF2
          generator = //PBKDF2.parse(accountlist[index].generator.toString());
          PBKDF2();
      var salt = accountlist[index].salt.toString();
      var hashtest =
          generator.generateBase64Key(passwortController.text, salt, 1000, 32);
      try {
        if (hashtest == accountlist[index].hash.toString()) {
          LocalServices.instance
              .add(Account(
                  id: accountlist[index].id.toString(),
                  benutzername: benutzernamenController.text,
                  hash: hashtest,
                  salt: salt,
                  generator: generator.toString(),
                  status: accountlist[index].status.toString(),
                  schulname: schulController.text))
              .then((value) {
            findAccounts();
            Navigator.of(context).pushReplacementNamed(Newspage.routeName);
          });
        } else {
          clarValues();

          return;
        }
      } catch (e) {
        clarValues();
        return;
      }
    });
  }

  void selectPagetoRegistrieren(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(RegistrierenPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SchoolDex'),
        backgroundColor: const Color.fromARGB(255, 29, 44, 89),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Wilkommen',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                const Text(
                  'bei SchoolDex!',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 5, 0, 15),
                  child: const Text(
                    'Eurem Schwarzenbrett',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: TextField(
                      decoration:
                          const InputDecoration(labelText: 'Benutzername'),
                      controller: benutzernamenController,
                      onSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_loginFocusNode);
                      }),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'Passwort'),
                    controller: passwortController,
                    focusNode: _loginFocusNode,
                    obscureText: true,
                    onSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_schulFocusNode);
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'Schule'),
                    controller: schulController,
                    focusNode: _schulFocusNode,
                    obscureText: false,
                    onSubmitted: (_) => submitData(),
                  ),
                ),
                TextButton(
                  child: Text(
                    'Einloggen',
                    style: TextStyle(color: Colors.orange.shade700),
                  ),
                  onPressed: () => submitData,
                ),
                TextButton(
                  child: Text(
                    'Du hast noch kein Konto, dann klicke hier',
                    style: TextStyle(color: Colors.orange.shade700),
                  ),
                  onPressed: () => selectPagetoRegistrieren(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

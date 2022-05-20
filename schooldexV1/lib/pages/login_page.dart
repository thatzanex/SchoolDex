import 'package:SchoolDex/db/accounts_services.dart';
import 'package:flutter/material.dart';
import 'registrieren_page.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final benutzernamenController = TextEditingController();
  final passwortController = TextEditingController();
  final schulController = TextEditingController();

  final _loginFocusNode = FocusNode();
  final _schulFocusNode = FocusNode();

  void submitData() {
    ServicesAccount.getAccount(schulController.text).then((accountlist) {});
  }

  void selectPagetoRegistrieren(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(RegistrierenPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SchoolDex'),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Center(
          child: Column(
            children: [
              Text(
                'Wilkommen',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              Text(
                'bei SchoolDex!',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 5, 0, 15),
                child: Text(
                  'Eurem Schwarzenbrett',
                  style: TextStyle(
                    fontSize: 20,
                    //fontWeight: FontWeight.bold,
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
                  obscureText: true,
                  onSubmitted: (_) => submitData(),
                ),
              ),
              TextButton(
                child: const Text('Einloggen'),
                onPressed: submitData,
              ),
              TextButton(
                child: const Text(
                  'Du hast noch kein Konto, dann klicke hier',
                  //style: TextStyle(color: Colors.black),
                ),
                onPressed: () => selectPagetoRegistrieren(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

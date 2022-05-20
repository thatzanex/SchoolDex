import 'package:SchoolDex/db/accounts_services.dart';
import 'package:SchoolDex/pages/login_page.dart';
import 'package:SchoolDex/pages/news_page.dart';
import 'package:flutter/material.dart';

class RegistrierenPage extends StatefulWidget {
  static const routeName = '/registrieren';

  @override
  State<RegistrierenPage> createState() => _RegistrierenPageState();
}

class _RegistrierenPageState extends State<RegistrierenPage> {
  final benutzernamenController = TextEditingController();
  final passwortController = TextEditingController();
  final schulController = TextEditingController();
  final codeController = TextEditingController();

  final _passwortFocusNode = FocusNode();
  final _schulFocusNode = FocusNode();
  final _codeFocusNode = FocusNode();
  String status = '0';

  void submitData() {
    if (benutzernamenController.text.isEmpty ||
        passwortController.text.isEmpty ||
        schulController.text.isEmpty ||
        codeController.text.isEmpty) {
      return;
    } else {
      if (codeController.text == 'L135') {
        status = '1';
      } else {
        status = '0';
      }
      ServicesAccount.addAccount(benutzernamenController.text,
              passwortController.text, schulController.text, status)
          .then((value) {
        if (value == 'success') {
          Navigator.of(context).pushReplacementNamed(Newspage.routeName);
        } else {
          return;
        }
      });
    }
  }

  void selectPagetoLogin(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(LoginPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   IconButton(
        //       onPressed: () => Navigator.of(context)
        //           .pushReplacementNamed(LoginPage.routeName),
        //       icon: Icon(Icons.keyboard_backspace))
        // ],
        title: const Text('SchoolDex'),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Center(
          child: Column(
            children: [
              Text(
                'Registrier dich',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              Text(
                'jetzt!',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 5, 0, 15),
                child: Column(
                  children: [
                    Text(
                      'Und mache SchoolDex',
                      style: TextStyle(
                        fontSize: 20,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'zu deinem Schwarzenbrett',
                      style: TextStyle(
                        fontSize: 20,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: TextField(
                    decoration:
                        const InputDecoration(labelText: 'Benutzername'),
                    controller: benutzernamenController,
                    onSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_passwortFocusNode);
                    }),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: TextField(
                  decoration: const InputDecoration(labelText: 'Passwort'),
                  controller: passwortController,
                  focusNode: _passwortFocusNode,
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
                  onSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_codeFocusNode);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: TextField(
                  decoration: const InputDecoration(labelText: 'Code'),
                  controller: codeController,
                  focusNode: _codeFocusNode,
                  obscureText: true,
                  onSubmitted: (_) => submitData(),
                ),
              ),
              TextButton(
                child: const Text('Registrieren'),
                onPressed: submitData,
              ),
              TextButton(
                child: const Text(
                    'Du hast doch schon ein Konto, dann klicke hier'),
                onPressed: () => selectPagetoLogin(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:SchoolDex/db/accounts_services.dart';
import 'package:SchoolDex/models/account.dart';
import 'package:SchoolDex/pages/login_page.dart';
import 'package:SchoolDex/pages/news_page.dart';
import 'package:flutter/material.dart';
import '../db/local_services.dart';

class RegistrierenPage extends StatefulWidget {
  static const routeName = '/registrieren';
  final Function accountstatus;
  RegistrierenPage(this.accountstatus);

  @override
  State<RegistrierenPage> createState() => _RegistrierenPageState();
}

class _RegistrierenPageState extends State<RegistrierenPage> {
  final benutzernamenController = TextEditingController();
  final passwortController = TextEditingController();
  final wiederholungsController = TextEditingController();
  final schulController = TextEditingController();
  final codeController = TextEditingController();

  final _passwortFocusNode = FocusNode();
  final _wiederholungsFocusNode = FocusNode();
  final _schulFocusNode = FocusNode();
  final _codeFocusNode = FocusNode();
  String status = '0';

  @override
  void initState() {
    findAccounts();
    super.initState();
  }

  findAccounts() {
    //LocalServices.instance.remove('17');
    try {
      LocalServices.instance.getAccount().then((value) {
        print('findAccounts: $value');
        try {
          widget.accountstatus(
              value[0].id.toString(),
              value[0].benutzername.toString(),
              value[0].schulname.toString(),
              value[0].status.toString());
          print('getAccounts');
          Navigator.of(context).pushReplacementNamed(Newspage.routeName);
        } catch (e) {
          return;
        }
      });
    } catch (e) {
      return;
    }
  }

  clarValues() {
    benutzernamenController.text = '';
    passwortController.text = '';
    wiederholungsController.text = '';
    schulController.text = '';
    codeController.text = '';
  }

  void submitData() {
    if (benutzernamenController.text.isEmpty ||
        passwortController.text.isEmpty ||
        schulController.text.isEmpty ||
        codeController.text.isEmpty) {
      return;
    } else if (wiederholungsController.text == passwortController.text) {
      ServicesAccount.getAccount(schulController.text).then((accountlist) {
        print('test');
        print(accountlist);
        String matchingList = benutzernamenController.text;
        var index = accountlist.indexWhere(
            (element) => matchingList.contains(element.benutzername));
        try {
          if (passwortController.text ==
              accountlist[index].passwort.toString()) {
            print('1');
            clarValues();
            //Navigator.of(context).pushReplacementNamed(Newspage.routeName);
            return;
          } else {
            print('2');
            clarValues();
            return;
          }
        } catch (e) {
          print('3');
          if (codeController.text == 'L135' || codeController.text == 'S246') {
            print('Registrieren');
            ServicesAccount.addAccount(
                    benutzernamenController.text,
                    passwortController.text,
                    schulController.text,
                    codeController.text)
                .then((value1) {
              List<String> matchingList = [
                benutzernamenController.text,
              ];
              ServicesAccount.getAccount(schulController.text).then((value2) {
                print('14: ${value2}');
                var index = value2.indexWhere(
                    (element) => matchingList.contains(element.benutzername));
                LocalServices.instance
                    .add(Account(
                        id: accountlist[index].id.toString(),
                        benutzername: benutzernamenController.text,
                        passwort: passwortController.text,
                        schulname: schulController.text,
                        status: codeController.text))
                    .then((value) {
                  print('Test erfolgreich');
                  if (value1 == 'success') {
                    print('Hallo');
                    findAccounts();
                    Navigator.of(context)
                        .pushReplacementNamed(Newspage.routeName);
                  } else {
                    return;
                  }
                });
              });
            });
          } else {
            return;
          }
        }
      });
    } else {
      return;
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
        margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Registrier dich',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const Text(
                'jetzt!',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 15),
                child: Column(
                  children: [
                    Text(
                      'Und mache SchoolDex',
                      style: const TextStyle(
                        fontSize: 20,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'zu deinem Schwarzenbrett',
                      style: const TextStyle(
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
                    FocusScope.of(context)
                        .requestFocus(_wiederholungsFocusNode);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: TextField(
                  decoration:
                      const InputDecoration(labelText: 'Passwort wiederholen'),
                  controller: wiederholungsController,
                  focusNode: _wiederholungsFocusNode,
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

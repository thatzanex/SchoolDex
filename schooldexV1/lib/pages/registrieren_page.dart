//import 'package:schooldex/db/accounts_services.dart';
import 'package:schooldex/models/account.dart';
import 'package:schooldex/pages/login_page.dart';
import 'package:schooldex/pages/news_page.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../db/account_local_services.dart';
import '../db/local_db/account_local.dart';
import 'package:conduit_password_hash/conduit_password_hash.dart';

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
    //LocalServices.instance.remove('1');
    try {
      LocalServices.instance.getAccount().then((value) {
        try {
          widget.accountstatus(
              value[0].id.toString(),
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

  Widget popupdialog(String text) {
    return Container(
      color: Colors.orange,
      padding: const EdgeInsets.fromLTRB(5, 20, 5, 60),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  clarValues() {
    benutzernamenController.text = '';
    passwortController.text = '';
    wiederholungsController.text = '';
    schulController.text = '';
    codeController.text = '';
  }

  submitData() {
    if (benutzernamenController.text.isEmpty ||
        passwortController.text.isEmpty ||
        schulController.text.isEmpty ||
        codeController.text.isEmpty) {
      return;
    } else if (wiederholungsController.text == passwortController.text) {
      String id = const Uuid().v4();
      print(id);
      // AccountLocalServices.instance
      //     .add(Account(
      //         id: id,
      //         benutzername: benutzernamenController.text,
      //         passwort: passwortController.text,
      //         schulname: schulController.text,
      //         status: codeController.text))
      //     .then((value1) {
      //   findAccounts();
      //   Navigator.of(context).pushReplacementNamed(Newspage.routeName);
      //} else {
      //  return;
      //}
      //;
      // ServicesAccount.createTable(schulController.text).then((value) {
      //   if (value == 'sucess') {
      AccountLocalServices.instance.getAccount().then((accountlist) {
        List<String> matchingList = [
          benutzernamenController.text,
        ];
        var index = accountlist.indexWhere(
            (element) => matchingList.contains(element.benutzername));
        String hashtest = Password.hash(
            passwortController.text, PBKDF2(salt: salt.toString()));
        try {
          if (hashtest == accountlist[index].hash.toString()) {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return popupdialog('Dieser Benutzername existert schon');
                });
            clarValues();
          } else {
            clarValues();
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return popupdialog('Dieser Benutzername existert schon');
                });
          }
        } catch (e) {
          if (codeController.text == 'L135' ||
              codeController.text == 'S246' ||
              codeController.text == 'Admin789') {
            var generator = PBKDF2();
            var salt = generateAsBase64String();
            var hash =
                generator.generateKey("mytopsecretpassword", salt, 1000, 32);
            AccountLocalServices.instance
                .add(Account(
              id: id,
              benutzername: benutzernamenController.text,
              hash: hash.toString(),
              salt: salt.toString(),
              status: codeController.text,
              schulname: schulController.text,
            ))
                .then((value1) {
              List<String> matchingList = [
                benutzernamenController.text,
              ];
              AccountLocalServices.instance.getAccount().then((value2) {
                var index = value2.indexWhere(
                    (element) => matchingList.contains(element.benutzername));
                LocalServices.instance
                    .add(Account(
                  id: accountlist[index].id.toString(),
                  benutzername: benutzernamenController.text,
                  hash: hash.toString(),
                  salt: salt.toString(),
                  status: codeController.text,
                  schulname: schulController.text,
                ))
                    .then((value) {
                  findAccounts();
                  Navigator.of(context)
                      .pushReplacementNamed(Newspage.routeName);
                });
              });
            });
          } else {
            clarValues();
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return popupdialog('Geben sie einen gültigen Code ein');
                });
          }
        }
      });
      //});
      //   } else {
      //     clarValues();
      //     showModalBottomSheet(
      //         context: context,
      //         builder: (BuildContext context) {
      //           return popupdialog('Die Schule konnte nicht gefunden werden');
      //         });
      //   }

    } else {
      clarValues();
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return popupdialog('Geben Sie zwei gleiche Passwörter ein');
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
        backgroundColor: const Color.fromARGB(255, 29, 44, 89),
        title: const Text('SchoolDex'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Willkommen',
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
                    'Registriere dich jetzt',
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
                    decoration: const InputDecoration(
                        labelText: 'Passwort wiederholen'),
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
                  child: Text(
                    'Registrieren',
                    style: TextStyle(color: Colors.orange.shade700),
                  ),
                  onPressed: () => submitData(),
                ),
                TextButton(
                  child: Text(
                    'Du hast schon ein Konto, dann klicke hier',
                    style: TextStyle(color: Colors.orange.shade700),
                  ),
                  onPressed: () => selectPagetoLogin(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

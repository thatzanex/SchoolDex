import 'package:flutter/material.dart';
import '../db/nachhilfe_services.dart';
import '../models/nachhilfe.dart';
import '../widgets/nachhilfe_list.dart';
import '../widgets/nachhilfe_new.dart';
import '../widgets/MyBottomNavigationBar.dart';
//import '../widgets/account_bottom.dart';

class Nachhilfepage extends StatefulWidget {
  static const routeName = '/nachhilfe';
  @override
  State<Nachhilfepage> createState() => _NachhilfepageState();
}

class _NachhilfepageState extends State<Nachhilfepage> {
  List<Nachhilfe> _userNachhilfen = [
    Nachhilfe(
      fach: 'Mathematik',
      jahrgang: '8',
      beschreibung:
          'Ich würde mich freuen, wenn ich euer neuer Nachhilfelehrer werden würde. Ihr könnt mich erreichen unter +49 123 4567890',
    ),
  ];
  @override
  void initState() {
    super.initState();
    _userNachhilfen = [];
    _getNachhilfen();
  }

  _getNachhilfen() {
    ServicesNachhilfe.getNachhilfe().then((nachhilfen) {
      setState(() {
        _userNachhilfen = nachhilfen;
      });
    });
  }

  void _addNeueNachhilfe(
      String nxFach, String nxJahrgang, String nxBeschreibung) {
    ServicesNachhilfe.addNachhilfe(
      nxFach,
      nxJahrgang,
      nxBeschreibung,
    ).then((value) {
      ServicesNachhilfe.getNachhilfe().then((nachhilfen1) {
        setState(() {
          _userNachhilfen = nachhilfen1;
        });
      });
    });
  }

  void _startAddNeueNachhilfe(BuildContext cnx) {
    showModalBottomSheet(
      context: cnx,
      builder: (_) {
        return NeueNachhilfe(_addNeueNachhilfe);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nachhilfeangebot'),
          actions: <Widget>[
            IconButton(
              onPressed: () => _getNachhilfen(),
              icon: Icon(Icons.replay_outlined),
              iconSize: 35,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //NachhilfeListe(_userNachhilfen),
              NachhilfeListe(_userNachhilfen),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => _startAddNeueNachhilfe(context),
        ),
        bottomNavigationBar: MyBottomNavigationBar(Colors.white, Colors.orange,
            Colors.white, Colors.white, Colors.white));
  }
}

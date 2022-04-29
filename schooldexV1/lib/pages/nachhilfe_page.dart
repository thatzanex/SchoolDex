import 'package:flutter/material.dart';
import '../models/nachhilfe.dart';
import '../widgets/list_nachhilfe.dart';
import '../widgets/new_nachhilfe.dart';
import '../widgets/MyBottomNavigationBar.dart';
import '../widgets/account_bottom.dart';

class Nachhilfepage extends StatefulWidget {
  static const routeName = '/nachhilfe';
  @override
  State<Nachhilfepage> createState() => _NachhilfepageState();
}

class _NachhilfepageState extends State<Nachhilfepage> {
  final List<Nachhilfe> _userNachhilfen = [
    Nachhilfe(
      fach: 'Mathematik',
      jahrgang: '8',
      beschreibung:
          'Ich würde mich freuen, wenn ich euer neuer Nachhilfelehrer werden würde. Ihr könnt mich erreichen unter +49 123 4567890',
    ),
  ];

  void _addNeueNachhilfe(
      String nxFach, String nxJahrgang, String nxBeschreibung) {
    final newNx = Nachhilfe(
      fach: nxFach,
      jahrgang: nxJahrgang,
      beschreibung: nxBeschreibung,
    );

    setState(() {
      _userNachhilfen.add(newNx);
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
        actions: <Widget>[MyAccountbottom()],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //NachhilfeListe(_userNachhilfen),
            NachhilfeListe(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _startAddNeueNachhilfe(context),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
          Colors.white, Colors.orange, Colors.white, Colors.white),
    );
  }
}

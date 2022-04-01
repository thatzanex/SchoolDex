import 'package:flutter/material.dart';
import '../widgets/new_ag.dart';
import '../models/ag.dart';
import '../widgets/MyBottomNavigationBar.dart';
import '../widgets/account_bottom.dart';
import '../widgets/list_ag.dart';

class AGPage extends StatefulWidget {
  static const routeName = '/ags';
  @override
  _AGPageState createState() => _AGPageState();
}

class _AGPageState extends State<AGPage> {
  final List<AGs> _userAGs = [
    AGs(
        thema: 'Ballsportspiele',
        jahrgang: '8',
        beschreibung:
            'Ich würde mich freuen, wenn ich euer neuer Nachhilfelehrer werden würde. Ihr könnt mich erreichen unter +49 123 4567890',
        termin: 'Dienstag 3-4 Stunde')
  ];
  void _addNeueAG(String nxThema, String nxJahrgang, String nxBeschreibung,
      String nxTermin) {
    final newAx = AGs(
        thema: nxThema,
        jahrgang: nxJahrgang,
        beschreibung: nxBeschreibung,
        termin: nxTermin);

    setState(() {
      _userAGs.add(newAx);
    });
  }

  void _startAddNeueAG(BuildContext cnx) {
    showModalBottomSheet(
      context: cnx,
      builder: (_) {
        return NeueAG(_addNeueAG);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AG Angebot'),
        actions: <Widget>[MyAccountbottom()],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AGliste(_userAGs),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _startAddNeueAG(context),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
          Colors.white, Colors.white, Colors.orange, Colors.white),
    );
  }
}

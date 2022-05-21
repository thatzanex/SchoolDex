import 'package:SchoolDex/db/ag_services.dart';
import 'package:flutter/material.dart';
import '../widgets/ag_new.dart';
import '../widgets/ag_list.dart';
import '../models/ag.dart';
import '../widgets/MyBottomNavigationBar.dart';

class AGPage extends StatefulWidget {
  static const routeName = '/ags';
  String isTeacher;
  String schulname;
  AGPage(this.isTeacher, this.schulname);
  @override
  _AGPageState createState() => _AGPageState();
}

class _AGPageState extends State<AGPage> {
  List<AGs> _userAGs = [
    AGs(
        thema: 'Ballsportspiele',
        jahrgang: '8',
        beschreibung:
            'Ich würde mich freuen, wenn ich euer neuer Nachhilfelehrer werden würde. Ihr könnt mich erreichen unter +49 123 4567890',
        termin: 'Dienstag 3-4 Stunde',
        schulname: 'SchoolDex')
  ];
  @override
  void initState() {
    super.initState();
    _userAGs = [];
    _getAgs();
  }

  _getAgs() {
    ServicesAgs.getAgs(widget.schulname).then((ags1) {
      setState(() {
        _userAGs = ags1;
      });
    });
  }

  void _addNeueAG(String nxThema, String nxJahrgang, String nxBeschreibung,
      String nxTermin, String nxSchulname) {
    ServicesAgs.addAgs(
            nxThema, nxJahrgang, nxBeschreibung, nxTermin, nxSchulname)
        .then((value) {
      ServicesAgs.getAgs(nxSchulname).then((ags2) {
        setState(() {
          _userAGs = ags2;
        });
      });
    });
  }

  void _startAddNeueAG(BuildContext cnx) {
    showModalBottomSheet(
      context: cnx,
      builder: (_) {
        return NeueAG(_addNeueAG, widget.schulname);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AG Angebot'),
        actions: <Widget>[
          IconButton(
            onPressed: () => _getAgs(),
            icon: Icon(Icons.replay_outlined),
            iconSize: 35,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AGliste(_userAGs, widget.schulname, widget.isTeacher),
          ],
        ),
      ),
      floatingActionButton: widget.isTeacher.endsWith('L135')
          ? FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => _startAddNeueAG(context),
            )
          : Container(),
      bottomNavigationBar: MyBottomNavigationBar(Colors.white, Colors.white,
          Colors.orange, Colors.white, Colors.white),
    );
  }
}

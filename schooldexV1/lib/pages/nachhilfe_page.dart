import 'package:flutter/material.dart';
import 'package:schooldex/models/ag.dart';
import 'package:schooldex/models/blackboard.dart';
import 'package:schooldex/pages/search_page.dart';
import 'package:schooldex/widgets/account_bottom.dart';
import '../db/nachhilfe_services.dart';
import '../models/nachhilfe.dart';
import '../widgets/nachhilfe_list.dart';
import '../widgets/nachhilfe_new.dart';
import '../widgets/MyBottomNavigationBar.dart';

class Nachhilfepage extends StatefulWidget {
  static const routeName = '/nachhilfe';
  String isTeacher;
  String benutzername;
  String userId;
  String schulname;
  final Function searchNachhilfen;
  Nachhilfepage(this.isTeacher, this.userId, this.benutzername, this.schulname,
      this.searchNachhilfen);
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
        userId: '1',
        username: 'Max Mustermann',
        schulname: 'SchoolDex'),
  ];
  @override
  void initState() {
    super.initState();
    _userNachhilfen = [];
    _createTable();
    _getNachhilfen();
  }

  _createTable() {
    ServicesNachhilfe.createTable(widget.schulname).then((result) {
      if ('success' == result) {
        _getNachhilfen();
      }
    });
  }

  _getNachhilfen() {
    ServicesNachhilfe.getNachhilfe(widget.schulname).then((nachhilfen) {
      setState(() {
        _userNachhilfen = nachhilfen;
      });
    });
  }

  void _addNeueNachhilfe(
      String nxFach,
      String nxJahrgang,
      String nxBeschreibung,
      String nxUserId,
      String nxUsername,
      String nxSchulname) {
    ServicesNachhilfe.addNachhilfe(nxFach, nxJahrgang, nxBeschreibung, nxUserId,
            nxUsername, nxSchulname)
        .then((value) {
      ServicesNachhilfe.getNachhilfe(nxSchulname).then((nachhilfen1) {
        setState(() {
          _userNachhilfen = nachhilfen1;
        });
      });
    });
  }

  void _startAddNeueNachhilfe(BuildContext cnx) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return DraggableScrollableSheet(
            maxChildSize: 0.88,
            initialChildSize: 0.88,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                  controller: scrollController,
                  child: NeueNachhilfe(_addNeueNachhilfe, widget.userId,
                      widget.benutzername, widget.schulname));
            });
      },
    );
  }

  void _startsearchNachhilfen(BuildContext ctx) {
    List<AGs> listchen = [];
    List<Blackboard> listchen1 = [];
    widget.searchNachhilfen(
        _userNachhilfen, listchen, listchen1, 'Nachhilfe durchsuchen');
    Navigator.of(context).pushNamed(Searchpage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              icon: const Icon(Icons.search),
              iconSize: 35,
              onPressed: () {
                _startsearchNachhilfen(context);
              }),
          backgroundColor: const Color.fromARGB(255, 29, 44, 89),
          title: const Text('Nachhilfeangebot'),
          actions: <Widget>[
            IconButton(
              onPressed: () => _getNachhilfen(),
              icon: const Icon(Icons.replay_outlined),
              iconSize: 35,
            ),
            const MyAccountbottom(),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top,
                child: NachhilfeListe(_userNachhilfen, widget.schulname,
                    widget.isTeacher, widget.userId),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 29, 44, 89),
          child: const Icon(Icons.add),
          onPressed: () => _startAddNeueNachhilfe(context),
        ),
        bottomNavigationBar: MyBottomNavigationBar(Colors.white, Colors.orange,
            Colors.white, Colors.white, Colors.white));
  }
}

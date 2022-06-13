import 'package:flutter/material.dart';
import 'package:schooldex/models/ag.dart';
import 'package:schooldex/models/nachhilfe.dart';
import 'package:schooldex/pages/search_page.dart';
import 'package:schooldex/widgets/account_bottom.dart';
import '../db/blackboard_services.dart';
import '../models/blackboard.dart';
import '../widgets/blackboard/blackboard_list.dart';
import '../widgets/blackboard/blackboard_new.dart';
import '../widgets/MyBottomNavigationBar.dart';
import 'package:intl/intl.dart';

class Blackboardpage extends StatefulWidget {
  static const routeName = '/blackboard';
  String isTeacher;
  String benutzername;
  String userId;
  String schulname;
  final Function searchNachhilfen;
  Blackboardpage(this.isTeacher, this.userId, this.benutzername, this.schulname,
      this.searchNachhilfen);
  @override
  State<Blackboardpage> createState() => _BlackboardpageState();
}

class _BlackboardpageState extends State<Blackboardpage> {
  List<Blackboard> _userBlackboard = [
    Blackboard(
        ueberschrift: 'Mathematik',
        beschreibung:
            'Ich habe meinen Turnbeutel vergessen, hat ihn vielleicht jemand von euch gefunden?',
        color: '5',
        datum: DateFormat('dd.MM.yyyy').format(DateTime.now()),
        userId: '1',
        username: 'Max Mustermann',
        schulname: 'SchoolDex'),
  ];
  @override
  void initState() {
    super.initState();
    _userBlackboard = [];
    _createTable();
    _getBlackboards();
  }

  _createTable() {
    ServicesBlackboard.createTable(widget.schulname).then((result) {
      if ('success' == result) {
        _getBlackboards();
      }
    });
  }

  _getBlackboards() {
    ServicesBlackboard.getBlackboard(widget.schulname).then((blackboard) {
      setState(() {
        _userBlackboard = blackboard;
      });
    });
  }

  void _addNeueBlackboards(
      String nxUeberschrift,
      String nxBeschreibung,
      String nxColor,
      String nxDatum,
      String nxUserId,
      String nxUsername,
      String nxSchulname) {
    ServicesBlackboard.addBlackboard(nxUeberschrift, nxBeschreibung, nxColor,
            nxDatum, nxUserId, nxUsername, nxSchulname)
        .then((value) {
      ServicesBlackboard.getBlackboard(nxSchulname).then((blackboard1) {
        setState(() {
          _userBlackboard = blackboard1;
        });
      });
    });
  }

  void _startAddNeueBlackboards(BuildContext cnx) {
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
                  child: NeueBlackboard(_addNeueBlackboards, widget.userId,
                      widget.benutzername, widget.schulname));
            });
      },
    );
  }

  void _startsearchBlackboards(BuildContext ctx) {
    List<AGs> listchen = [];
    List<Nachhilfe> listchen1 = [];
    widget.searchNachhilfen(
        listchen1, listchen, _userBlackboard, 'Suchen & Finden durchsuchen');
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
                _startsearchBlackboards(context);
              }),
          backgroundColor: const Color.fromARGB(255, 29, 44, 89),
          title: const Text('Suchen & Finden'),
          actions: <Widget>[
            IconButton(
              onPressed: () => _getBlackboards(),
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
                child: BlackboardListe(_userBlackboard, widget.schulname,
                    widget.isTeacher, widget.userId),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 29, 44, 89),
          child: const Icon(Icons.add),
          onPressed: () => _startAddNeueBlackboards(context),
        ),
        bottomNavigationBar: MyBottomNavigationBar(
          Colors.white,
          Colors.white,
          Colors.white,
          Colors.orange,
          Colors.white,
        ));
  }
}

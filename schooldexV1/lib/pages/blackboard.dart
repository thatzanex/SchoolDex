import 'package:flutter/material.dart';
import 'package:schooldex/models/ag.dart';
import 'package:schooldex/pages/search_page.dart';
import '../db/blackboard_services.dart';
import '../models/blackboard.dart';
// import '../widgets/blackboard_list.dart';
// import '../widgets/blackboard_new.dart';
import '../widgets/MyBottomNavigationBar.dart';

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
        userId: '1',
        username: 'Max Mustermann',
        schulname: 'SchoolDex'),
  ];
  @override
  void initState() {
    super.initState();
    _userBlackboard = [];
    _getBlackboards();
  }

  _getBlackboards() {
    ServicesBlackboard.getBlackboard(widget.schulname).then((blackboard) {
      setState(() {
        _userBlackboard = blackboard;
      });
    });
  }

  void _addNeueBlackboards(String nxUeberschrift, String nxBeschreibung,
      String nxUserId, String nxUsername, String nxSchulname) {
    ServicesBlackboard.addBlackboard(
            nxUeberschrift, nxBeschreibung, nxUserId, nxUsername, nxSchulname)
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
              return Container();
              // return SingleChildScrollView(
              //     controller: scrollController,
              //     child: NeueNachhilfe(_addNeueBlackboards, widget.userId,
              //         widget.benutzername, widget.schulname));
            });
      },
    );
  }

  void _startsearchBlackboards(BuildContext ctx) {
    List<AGs> listchen = [];
    widget.searchNachhilfen(
        _userBlackboard, listchen, 'Suchen & Finden durchsuchen');
    Navigator.of(context).pushNamed(Searchpage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top,
                child: Container(),
                //   child: NachhilfeListe(_userBlackboard, widget.schulname,
                //       widget.isTeacher, widget.userId),
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

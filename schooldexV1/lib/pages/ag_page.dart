import 'package:schooldex/db/ag_services.dart';
import 'package:flutter/material.dart';
import 'package:schooldex/db/local_db/ag_local.dart';
import 'package:schooldex/models/nachhilfe.dart';
import 'package:schooldex/pages/search_page.dart';
import 'package:schooldex/widgets/account_bottom.dart';
import '../widgets/ag/ag_new.dart';
import '../widgets/ag/ag_list.dart';
import '../models/ag.dart';
import '../models/blackboard.dart';
import '../widgets/MyBottomNavigationBar.dart';
import 'package:uuid/uuid.dart';

class AGPage extends StatefulWidget {
  static const routeName = '/ags';
  final String isTeacher;
  final String schulname;
  final String userId;
  final Function searchAgs;
  const AGPage(this.isTeacher, this.schulname, this.userId, this.searchAgs,
      {Key? key})
      : super(key: key);
  @override
  State<AGPage> createState() => _AGPageState();
}

class _AGPageState extends State<AGPage> {
  var uudi = const Uuid().v4();
  List<AGs> _userAGs = [
    AGs(
        id: '5',
        thema: 'Ballsportspiele',
        jahrgang: '8',
        beschreibung:
            'Ich würde mich freuen, wenn ich euer neuer Nachhilfelehrer werden würde. Ihr könnt mich erreichen unter +49 123 4567890',
        termin: 'Dienstag 3-4 Stunde',
        schulname: 'SchoolDex',
        userId: '1')
  ];
  @override
  void initState() {
    super.initState();
    _userAGs = [];
    //_createTable();
    _getAgs();
  }

  // _createTable() {
  //   ServicesAgs.createTable(widget.schulname).then((result) {
  //     if ('success' == result) {
  //       _getAgs();
  //     }
  //   });
  // }

  _getAgs() {
    AGLocalServices.instance.getAccount().then((ags1) {
      setState(() {
        _userAGs = ags1;
      });
    });
  }

  void _addNeueAG(String nxThema, String nxJahrgang, String nxBeschreibung,
      String nxTermin, String nxSchulname, String userId) {
    AGLocalServices.instance
        .add(AGs(
            id: uudi,
            thema: nxThema,
            jahrgang: nxJahrgang,
            beschreibung: nxBeschreibung,
            termin: nxTermin,
            schulname: nxSchulname,
            userId: userId))
        .then((value) {
      AGLocalServices.instance.getAccount().then((ags2) {
        setState(() {
          _userAGs = ags2;
        });
      });
    });
  }

  void _startAddNeueAG(BuildContext cnx) {
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
                  child: NeueAG(_addNeueAG, widget.schulname, widget.userId));
            });
      },
    );
  }

  void _startsearchAgs(BuildContext ctx) {
    List<Nachhilfe> listchen = [];
    List<Blackboard> listchen1 = [];
    widget.searchAgs(listchen, _userAGs, listchen1, 'AG Angebote durchsuchen');
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
            _startsearchAgs(context);
          },
        ),
        backgroundColor: const Color.fromARGB(255, 29, 44, 89),
        title: const Text('AG Angebot'),
        actions: <Widget>[
          IconButton(
            onPressed: () => _getAgs(),
            icon: const Icon(Icons.replay_outlined),
            iconSize: 35,
          ),
          const MyAccountbottom()
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
              child: AGliste(_userAGs, widget.schulname, widget.isTeacher,
                  widget.userId, 0),
            ),
          ],
        ),
      ),
      floatingActionButton: widget.isTeacher.endsWith('L135') ||
              widget.isTeacher.endsWith('Admin789')
          ? FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 29, 44, 89),
              child: const Icon(Icons.add),
              onPressed: () => _startAddNeueAG(context),
            )
          : Container(),
      bottomNavigationBar: MyBottomNavigationBar(Colors.white, Colors.white,
          Colors.orange, Colors.white, Colors.white),
    );
  }
}

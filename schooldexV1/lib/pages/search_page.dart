import 'package:flutter/material.dart';
import 'package:schooldex/models/ag.dart';
import 'package:schooldex/models/blackboard.dart';
import 'package:schooldex/models/nachhilfe.dart';
import 'package:schooldex/widgets/ag/ag_list.dart';
import 'package:schooldex/widgets/blackboard/blackboard_list.dart';
import 'package:schooldex/widgets/mybottomnavigationbar.dart';
import 'package:schooldex/widgets/nachhilfen/nachhilfe_list.dart';

class Searchpage extends StatefulWidget {
  static const routeName = '/search';
  const Searchpage(this.nachhilfen, this.ags, this.blackboards, this.title,
      this.schulname, this.userId, this.isTeacher,
      {Key? key})
      : super(key: key);
  final List<Nachhilfe> nachhilfen;
  final List<AGs> ags;
  final List<Blackboard> blackboards;
  final String title;
  final String schulname;
  final String userId;
  final String isTeacher;

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  List<Nachhilfe> nachhilfeListe = [];
  List<Nachhilfe> nachhilfeListe1 = [];
  List<Nachhilfe> nachhilfeListecombiniert = [];
  List<Blackboard> blackboardliste = [];
  List<Blackboard> blackboardListe1 = [];
  List<Blackboard> blackboardListecombiniert = [];
  List<AGs> agListe = [];
  List<AGs> agListe1 = [];
  List<AGs> agListecombiniert = [];
  final searchcontroler = TextEditingController();

  @override
  void initState() {
    nachhilfeListecombiniert = widget.nachhilfen;
    agListecombiniert = widget.ags;
    blackboardListecombiniert = widget.blackboards;
    super.initState();
  }

  searchNachhilfe() {
    setState(() {
      nachhilfeListe = widget.nachhilfen
          .where((element) => element.fach
              .contains(RegExp(searchcontroler.text, caseSensitive: false)))
          .toList();
      nachhilfeListe1 = widget.nachhilfen
          .where((element) => element.jahrgang
              .contains(RegExp(searchcontroler.text, caseSensitive: false)))
          .toList();
      nachhilfeListecombiniert = nachhilfeListe + nachhilfeListe1;
    });
  }

  searchAGs() {
    setState(() {
      agListe = widget.ags
          .where((element) => element.thema
              .contains(RegExp(searchcontroler.text, caseSensitive: false)))
          .toList();
      agListe1 = widget.ags
          .where((element) => element.jahrgang
              .contains(RegExp(searchcontroler.text, caseSensitive: false)))
          .toList();
      agListecombiniert = agListe + agListe1;
    });
  }

  searchBlackboards() {
    setState(() {
      blackboardliste = widget.blackboards
          .where((element) => element.ueberschrift
              .contains(RegExp(searchcontroler.text, caseSensitive: false)))
          .toList();
      blackboardListe1 = widget.blackboards
          .where((element) => element.beschreibung
              .contains(RegExp(searchcontroler.text, caseSensitive: false)))
          .toList();
      blackboardListecombiniert = blackboardliste + blackboardListe1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color.fromARGB(255, 29, 44, 89),
      ),
      body: widget.title.startsWith('Nachhilfe')
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.all(10),
                      child: TextField(
                        controller: searchcontroler,
                        onSubmitted: (_) => searchNachhilfe(),
                      )),
                  TextButton(
                      onPressed: searchNachhilfe,
                      child: const Text(
                        'Suchen',
                        style: TextStyle(fontSize: 15),
                      )),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: (MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).padding.top) *
                              0.7,
                          child: NachhilfeListe(
                            nachhilfeListecombiniert,
                            widget.schulname,
                            widget.isTeacher,
                            widget.userId,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          : widget.title.startsWith('AG')
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.all(10),
                          child: TextField(
                            controller: searchcontroler,
                            onSubmitted: (_) => searchAGs(),
                          )),
                      TextButton(
                          onPressed: searchAGs,
                          child: const Text(
                            'Suchen',
                            style: TextStyle(fontSize: 15),
                          )),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: (MediaQuery.of(context).size.height -
                                      MediaQuery.of(context).padding.top) *
                                  0.7,
                              child: AGliste(
                                agListecombiniert,
                                widget.schulname,
                                widget.isTeacher,
                                widget.userId,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.all(10),
                          child: TextField(
                            controller: searchcontroler,
                            onSubmitted: (_) => searchBlackboards(),
                          )),
                      TextButton(
                          onPressed: searchBlackboards,
                          child: const Text(
                            'Suchen',
                            style: TextStyle(fontSize: 15),
                          )),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: (MediaQuery.of(context).size.height -
                                      MediaQuery.of(context).padding.top) *
                                  0.7,
                              child: BlackboardListe(
                                blackboardListecombiniert,
                                widget.schulname,
                                widget.isTeacher,
                                widget.userId,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
      bottomNavigationBar: widget.title.startsWith('Nachhilfe')
          ? MyBottomNavigationBar(
              Colors.white,
              Colors.orange,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
            )
          : widget.title.startsWith('AG')
              ? MyBottomNavigationBar(
                  Colors.white,
                  Colors.white,
                  Colors.orange,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                )
              : MyBottomNavigationBar(
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.orange,
                  Colors.white,
                  Colors.white,
                ),
    );
  }
}

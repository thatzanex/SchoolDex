import 'package:flutter/material.dart';
import 'package:schooldex/models/ag.dart';
import 'package:schooldex/models/nachhilfe.dart';
import 'package:schooldex/widgets/ag_list.dart';
import 'package:schooldex/widgets/mybottomnavigationbar.dart';
import 'package:schooldex/widgets/nachhilfe_list.dart';

class Searchpage extends StatefulWidget {
  static const routeName = '/search';
  const Searchpage(this.nachhilfen, this.ags, this.title, this.schulname,
      this.userId, this.isTeacher,
      {Key? key})
      : super(key: key);
  final List<Nachhilfe> nachhilfen;
  final List<AGs> ags;
  final String title;
  final String schulname;
  final String userId;
  final String isTeacher;

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  List<Nachhilfe> nachhilfeListe = [];
  List<AGs> agListe = [];
  final searchcontroler = TextEditingController();

  @override
  void initState() {
    nachhilfeListe = widget.nachhilfen;
    agListe = widget.ags;
    super.initState();
  }

  searchNachhilfe() {
    nachhilfeListe = widget.nachhilfen
        .where((element) => element.fach
            .contains(RegExp(searchcontroler.text, caseSensitive: false)))
        .toList();
  }

  searchAGs() {
    setState(() {
      agListe = widget.ags
          .where((element) => element.thema
              .contains(RegExp(searchcontroler.text, caseSensitive: false)))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: widget.title.startsWith('Nachhilfe')
          ? Column(
              children: [
                Container(
                    margin: const EdgeInsets.all(10),
                    child: TextField(
                      controller: searchcontroler,
                      onSubmitted: (_) => searchNachhilfe(),
                    )),
                NachhilfeListe(nachhilfeListe, widget.schulname,
                    widget.isTeacher, widget.userId, -100)
              ],
            )
          : Column(
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
                AGliste(agListe, widget.schulname, widget.isTeacher,
                    widget.userId, 258)
              ],
            ),
      bottomNavigationBar: MyBottomNavigationBar(
        Colors.white,
        Colors.white,
        Colors.orange,
        Colors.white,
        Colors.white,
      ),
    );
  }
}

import 'package:schooldex/db/news_services.dart';
import 'package:flutter/material.dart';
import '../models/news.dart';
import 'package:intl/intl.dart';
import '../widgets/MyBottomNavigationBar.dart';
import '../widgets/news_list.dart';
import '../widgets/news_new.dart';

class Newspage extends StatefulWidget {
  static const routeName = '/news';
  String isTeacher;
  String schulname;
  String userId;
  Newspage(this.isTeacher, this.schulname, this.userId);
  @override
  State<Newspage> createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  List<News> _userNews = [
    News(
        ueberschrift: 'Neuer Basketballkorb',
        //jahrgang: '8',
        inhalt:
            'Wir haben jetzt endlich einen neuen Basketballkorb. Kommt vorbei, seht ihn euch an und benutzt ihn',
        datum: DateFormat('dd.MM.yyyy').format(DateTime.now()),
        schulname: 'SchoolDex',
        userId: '1')
  ];
  @override
  void initState() {
    super.initState();
    _userNews = [];
    _getNews();
  }

  _getNews() {
    ServicesNews.getNews(widget.schulname).then((news1) {
      setState(() {
        _userNews = news1;
      });
    });
  }

  void _addNeueNews(String nxUeberschrift, String nxInhalt, String nxDatum,
      String nxSchulname, String nxuserId) {
    ServicesNews.addNews(
            nxUeberschrift, nxInhalt, nxDatum, nxSchulname, nxuserId)
        .then((value) {
      ServicesNews.getNews(nxSchulname).then((news2) {
        setState(() {
          _userNews = news2;
        });
      });
    });
  }

  void _startAddNeueNews(BuildContext cnx) {
    showModalBottomSheet(
      context: cnx,
      builder: (_) {
        return NeueNews(_addNeueNews, widget.schulname, widget.userId);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        actions: <Widget>[
          IconButton(
            onPressed: () => _getNews(),
            icon: const Icon(Icons.replay_outlined),
            iconSize: 35,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            NewsListe(
                _userNews, widget.schulname, widget.isTeacher, widget.userId),
          ],
        ),
      ),
      floatingActionButton: widget.isTeacher.startsWith('L135') ||
              widget.isTeacher.startsWith('Admin789')
          ? FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => _startAddNeueNews(context),
            )
          : Container(),
      bottomNavigationBar: MyBottomNavigationBar(Colors.orange, Colors.white,
          Colors.white, Colors.white, Colors.white),
    );
  }
}

import 'package:SchoolDex/db/news_services.dart';
import 'package:flutter/material.dart';
import '../models/news.dart';
import 'package:intl/intl.dart';
import '../widgets/MyBottomNavigationBar.dart';
import '../widgets/news_list.dart';
import '../widgets/news_new.dart';

class Newspage extends StatefulWidget {
  static const routeName = '/news';
  @override
  _NewspageState createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  List<News> _userNews = [
    News(
        ueberschrift: 'Neuer Basketballkorb',
        //jahrgang: '8',
        inhalt:
            'Wir haben jetzt endlich einen neuen Basketballkorb. Kommt vorbei, seht ihn euch an und benutzt ihn',
        datum: DateFormat('dd.MM.yyyy').format(DateTime.now()))
  ];

  void initState() {
    super.initState();
    _userNews = [];
    _getNews();
  }

  _getNews() {
    ServicesNews.getNews().then((news1) {
      setState(() {
        _userNews = news1;
      });
    });
  }

  void _addNeueNews(String nxUeberschrift, String nxInhalt, String nxDatum) {
    print('hallo');
    ServicesNews.addNews(nxUeberschrift, nxInhalt, nxDatum).then((value) {
      ServicesNews.getNews().then((news2) {
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
        return NeueNews(_addNeueNews);
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
            icon: Icon(Icons.replay_outlined),
            iconSize: 35,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            NewsListe(_userNews),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _startAddNeueNews(context),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
          Colors.orange, Colors.white, Colors.white, Colors.white),
    );
  }
}

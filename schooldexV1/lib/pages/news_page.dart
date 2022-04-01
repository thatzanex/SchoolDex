import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/news.dart';
import 'package:intl/intl.dart';
import '../widgets/MyBottomNavigationBar.dart';
import '../widgets/account_bottom.dart';
import '../widgets/list_news.dart';
import '../widgets/new_news.dart';

class Newspage extends StatefulWidget {
  @override
  _NewspageState createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  final List<News> _userNews = [
    News(
        ueberschrift: 'Neuer Basketballkorb',
        //jahrgang: '8',
        inhalt:
            'Wir haben jetzt endlich einen neuen Basketballkorb. Kommt vorbei, seht ihn euch an und benutzt ihn',
        datum: DateFormat('dd.MM.yyyy').format(DateTime.now()))
  ];

  void _addNeueNews(String nxUeberschrift, String nxInhalt, String nxDatum) {
    final newNx =
        News(ueberschrift: nxUeberschrift, inhalt: nxInhalt, datum: nxDatum);

    setState(() {
      _userNews.add(newNx);
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
        actions: <Widget>[MyAccountbottom()],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            NewsListe(_userNews),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNeueNews(context),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
          Colors.orange, Colors.white, Colors.white, Colors.white),
    );
  }
}

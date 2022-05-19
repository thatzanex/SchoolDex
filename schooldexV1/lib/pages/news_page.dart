import 'package:SchoolDex/db/news_services.dart';
import 'package:flutter/material.dart';
import '../models/news.dart';
import 'package:intl/intl.dart';
import '../widgets/MyBottomNavigationBar.dart';
//import '../widgets/account_bottom.dart';
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
    // final newNx =
    //     News(ueberschrift: nxUeberschrift, inhalt: nxInhalt, datum: nxDatum);
    // setState(() {
    //   _getNews();
    // });
    print('hallo');
    ServicesNews.getNews().then((news2) {
      setState(() {
        _userNews = news2;
      });
    });
    print('test');
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

Widget buildPopupDialog(BuildContext context, String id, String ueberschrift,
    String inhalt, String datum) {
  _deleteNews() {
    ServicesNews.deleteNews(id);
    Navigator.of(context).pop();
    print('hi');
  }

  _updateNews() {
    Navigator.of(context).pop();
    //ServicesNews.updateNews();
    return;
  }

  return AlertDialog(
    title: Column(
      children: [
        Text(ueberschrift, style: const TextStyle(fontWeight: FontWeight.bold)),
        Container(
          child: datum.isEmpty
              ? Container()
              : Text(datum, style: const TextStyle(fontSize: 15)),
        ),
      ],
    ),
    content: Container(
      child: Text(inhalt),
    ),
    actions: [
      Row(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 20, 0),
            child: IconButton(
                onPressed: () => _updateNews(),
                icon: Icon(
                  Icons.change_circle_outlined,
                  color: Colors.blue,
                )),
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close),
            label: const Text('Schließen'),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
            child: IconButton(
                onPressed: () => _deleteNews(),
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.blue,
                )),
          )
        ],
      ),
    ],
  );
}

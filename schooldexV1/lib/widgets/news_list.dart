import 'package:flutter/material.dart';
import '../models/news.dart';
import 'news_update.dart';
import '../db/news_services.dart';
import 'popup.dart';

class NewsListe extends StatefulWidget {
  NewsListe(this.neuigkeiten, this.schulname, this.isTeacher, this.userId);
  List<News> neuigkeiten;
  final String schulname;
  final String isTeacher;
  final String userId;

  @override
  State<NewsListe> createState() => _NewsListeState();
}

class _NewsListeState extends State<NewsListe> {
  _deleteNews(id) {
    ServicesNews.deleteNews(id, widget.schulname).then((value) {
      ServicesNews.getNews(widget.schulname).then((news2) {
        setState(() {
          widget.neuigkeiten = news2;
        });
      });
    });
  }

  _updateNews(String id, String ueberschrift, String inhalt, String datum,
      String schulname, String userId) {
    ServicesNews.updateNews(id, ueberschrift, inhalt, datum, schulname, userId)
        .then((value) {
      ServicesNews.getNews(schulname).then((news1) {
        setState(() {
          widget.neuigkeiten = news1;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: ListView.builder(
        itemBuilder: (cnx, index) {
          return GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                if (widget.isTeacher.startsWith('Admin789') ||
                    widget.userId ==
                        widget.neuigkeiten[index].userId.toString()) {
                  return buildPopupDialog(
                    context,
                    _updateNews,
                    _deleteNews,
                    widget.neuigkeiten[index].id.toString(),
                    widget.neuigkeiten[index].ueberschrift.toString(),
                    widget.neuigkeiten[index].inhalt.toString(),
                    widget.neuigkeiten[index].datum.toString(),
                    widget.neuigkeiten[index].schulname.toString(),
                    widget.neuigkeiten[index].userId.toString(),
                  );
                } else {
                  return schuelerPopupDialog(
                      context,
                      widget.neuigkeiten[index].ueberschrift.toString(),
                      widget.neuigkeiten[index].inhalt.toString(),
                      widget.neuigkeiten[index].datum.toString());
                }
              },
            ),
            child: Card(
              color: Colors.orange,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(5, 10, 10, 5),
                        child: Text(
                          widget.neuigkeiten[index].ueberschrift.toString(),
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                        child: Text(
                          widget.neuigkeiten[index].datum.toString(),
                          //style: TextStyle(),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      widget.neuigkeiten[index].inhalt.toString(),
                      style: const TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: widget.neuigkeiten.length,
      ),
    );
  }
}

Widget buildPopupDialog(
    BuildContext context,
    Function updateNews,
    Function deleteNews,
    String id,
    String ueberschrift,
    String inhalt,
    String datum,
    String schulname,
    String userId) {
  _startdeleteNews() {
    Navigator.of(context).pop();
    deleteNews(id);
  }

  _startupdateNews(BuildContext cnx) {
    Navigator.of(context).pop();
    showModalBottomSheet(
      context: cnx,
      builder: (_) {
        return UpdateNews(
            updateNews, id, ueberschrift, inhalt, datum, schulname, userId);
      },
    );
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
    content: Text(inhalt),
    actions: [
      Row(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 20, 0),
            child: IconButton(
                onPressed: () => _startupdateNews(context),
                icon: const Icon(
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
            padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
            child: IconButton(
                onPressed: () => _startdeleteNews(),
                icon: const Icon(
                  Icons.delete_outline,
                  color: Colors.blue,
                )),
          )
        ],
      ),
    ],
  );
}

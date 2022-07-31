import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../widgets/MyBottomNavigationBar.dart';
import '../widgets/account_bottom.dart';

class Mensapage extends StatelessWidget {
  const Mensapage({Key? key}) : super(key: key);
  static const routeName = '/mensa';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Speiseplan'),
        actions: <Widget>[MyAccountbottom()],
        backgroundColor: const Color.fromARGB(255, 29, 44, 89),
      ),
      body: WebView(
        initialUrl: 'https://asb-service.de/kita-schule/elisabethenschule/',
        javascriptMode: JavascriptMode.unrestricted,
        navigationDelegate: (NavigationRequest request) {
          if (request.url.contains('youtube.de')) {
            return NavigationDecision.prevent;
          }

          return NavigationDecision.navigate;
        },
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        Colors.white,
        Colors.white,
        Colors.white,
        Colors.white,
        Colors.white,
        Colors.orange,
      ),
    );
  }
}
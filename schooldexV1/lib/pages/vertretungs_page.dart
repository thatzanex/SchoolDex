import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../widgets/MyBottomNavigationBar.dart';
import '../widgets/account_bottom.dart';

class Vertretungspage extends StatelessWidget {
  static const routeName = '/vertretung';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vetretungsplan'),
        actions: <Widget>[MyAccountbottom()],
      ),
      body: WebView(
        initialUrl: 'https://vertretungsplan.musterschule.de',
        javascriptMode: JavascriptMode.unrestricted,
        navigationDelegate: (NavigationRequest request) {
          if (request.url.contains('youtube.de')) {
            return NavigationDecision.prevent;
          }

          return NavigationDecision.navigate;
        },
      ),
      bottomNavigationBar: MyBottomNavigationBar(
          Colors.white, Colors.white, Colors.white, Colors.orange),
    );
  }
}

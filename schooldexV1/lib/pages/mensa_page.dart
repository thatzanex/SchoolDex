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
        title: const Text('Speiseplan'),
        actions: <Widget>[MyAccountbottom()],
        backgroundColor: const Color.fromARGB(255, 29, 44, 89),
      ),
      body: WebView(
        initialUrl:
            'https://asb-service.de/wp-content/uploads/2022/06/speiseplan-as-kw25-26-ohne-salat.pdf',
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

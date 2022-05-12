import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../widgets/MyBottomNavigationBar.dart';
import '../widgets/account_bottom.dart';

class Mensapage extends StatelessWidget {
  static const routeName = '/mensa';
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://vertretungsplan.musterschule.de',
      javascriptMode: JavascriptMode.unrestricted,

      navigationDelegate: (NavigationRequest request) {
        if (request.url.contains('youtube.de')) {
          return NavigationDecision.prevent;
        }

        return NavigationDecision.navigate;
      },
    );
  }
}
